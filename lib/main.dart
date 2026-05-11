import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'data/database/db_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart' as fa;


import 'constants.dart';
import 'models/models.dart';
import 'screens/screens.dart';
import 'firebase_options.dart';
import 'utils/shop_category_resolver.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const TechHubApp());
}

class TechHubApp extends StatefulWidget {
  const TechHubApp({super.key});

  @override
  State<TechHubApp> createState() => _TechHubAppState();
}

class _TechHubAppState extends State<TechHubApp> {

  final _cartManager = CartManager();
  final _orderManager = OrderManager();
  final _bookmarkManager = BookmarkManager();         // NEW
  final _searchHistory = SearchHistoryManager();
  final _dbRepository = DbRepository();
  final fa.FirebaseAuth _auth = fa.FirebaseAuth.instance;
  late User _user;
  StreamSubscription<fa.User?>? _authSubscription;

  bool _loggedIn = false;
  bool _initialized = false;
  ThemeMode _themeMode = ThemeMode.dark;              // NEW

  void _toggleTheme() {                              // NEW
    setState(() {
      _themeMode =
      _themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    });
  }

  void _onAuthStateChanged(fa.User? u) {
    _bookmarkManager.bindToUser(u?.uid).then((_) {
      if (!mounted) return;
      setState(() {
        if (u != null) {
          _user = User.fromAuthUser(u);
        } else {
          _user = User(
            id: '',
            username: '',
            firstName: '',
            lastName: '',
            email: '',
            role: 'Tech Enthusiast',
            points: 0,
            profileImageUrl: 'assets/profile_pics/user_avatar.png',
          );
        }
      });
    });
  }

  late final GoRouter _router;

  @override
  void initState() {
    super.initState();

    final initial = _auth.currentUser;
    _user = initial != null
        ? User.fromAuthUser(initial)
        : User(
            id: '',
            username: '',
            firstName: '',
            lastName: '',
            email: '',
            role: 'Tech Enthusiast',
            points: 0,
            profileImageUrl: 'assets/profile_pics/user_avatar.png',
          );

    _authSubscription = _auth.authStateChanges().listen((u) {
      _onAuthStateChanged(u);
    });

    _router = GoRouter(
      initialLocation: '/splash',
      routes: [
        GoRoute(
          path: '/splash',
          builder: (_, __) => const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          ),
        ),

        GoRoute(
          path: '/login',
          builder: (_, __) => LoginPage(
            onLogIn: (creds) async {
              await _auth.signInWithEmailAndPassword(
                email: creds.email.trim(),
                password: creds.password,
              );

              final u = _auth.currentUser;
              setState(() {
                _loggedIn = true;
                if (u != null) _user = User.fromAuthUser(u);
              });
              _router.go('/explore');
            },
          ),
        ),

        ShellRoute(
          builder: (context, state, child) => _Shell(
            currentPath: state.matchedLocation,
            themeMode: _themeMode,
            onToggleTheme: _toggleTheme,
            child: child,
          ),
          routes: [
            GoRoute(
              path: '/explore',
              builder: (_, __) => ExplorePage(
                cartManager: _cartManager,
                orderManager: _orderManager,
                bookmarkManager: _bookmarkManager,   // NEW
                searchHistory: _searchHistory,        // NEW
                themeMode: _themeMode,               // NEW
                onToggleTheme: _toggleTheme,         // NEW
              ),
            ),
            GoRoute(
              path: '/orders',
              builder: (_, __) =>
                  MyOrdersPage(orderManager: _orderManager),
            ),
            GoRoute(
              path: '/account',
              builder: (_, __) => AccountPage(
                user: _user,
                bookmarkManager: _bookmarkManager,   // NEW
                onProfileUpdated: () {
                  final u = _auth.currentUser;
                  if (u != null) setState(() => _user = User.fromAuthUser(u));
                },
                onLogOut: (_) async {
                  await _auth.signOut();
                  setState(() => _loggedIn = false);
                  _router.go('/login');
                },
              ),
            ),
          ],
        ),

        GoRoute(
          path: '/store/:id',
          builder: (context, state) {
            final id = state.pathParameters['id']!;
            final base = techStores.firstWhere(
              (s) => s.id == id,
              orElse: () => techStores.first,
            );
            final shop = state.uri.queryParameters['shop'];
            final store = (shop != null && shop.isNotEmpty)
                ? ShopCategoryResolver.storeKeepingCategory(base, shop)
                : base;
            return StorePage(
              store: store,
              cartManager: _cartManager,
              ordersManager: _orderManager,
              bookmarkManager: _bookmarkManager,
              user: _user,                               // NEW
            );
          },
        ),
      ],

      redirect: (context, state) {
        final isSplash = state.matchedLocation == '/splash';
        final isLogin = state.matchedLocation == '/login';

        final loggedIn = _auth.currentUser != null;

        if (!_initialized) return null; // 🔥 DO NOT BLOCK NAVIGATION

        if (!loggedIn && !isLogin) return '/login';
        if (loggedIn && isLogin) return '/explore';
        if (isSplash) return loggedIn ? '/explore' : '/login';

        return null;
      },
    );

    _initAuth();
  }

  Future<void> _initAuth() async {
    // ← NEW: init database first — seeds JSON on first launch
    await _dbRepository.init();

    final loggedIn = _auth.currentUser != null;

    await _bookmarkManager.bindToUser(_auth.currentUser?.uid);
    await _searchHistory.load();

    if (!mounted) return;

    setState(() {
      _loggedIn = loggedIn;
      _initialized = true;
      final u = _auth.currentUser;
      if (u != null) _user = User.fromAuthUser(u);
    });

    _router.go(loggedIn ? '/explore' : '/login');
  }

  @override
  void dispose() {
    _authSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'TechHub',
      theme: ThemeData.light(useMaterial3: true),
      darkTheme: techHubTheme(),
      themeMode: _themeMode,
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
    );
  }
}

// ─── Shell ───────────────────────────────────────────────

class _Shell extends StatelessWidget {
  final String currentPath;
  final ThemeMode themeMode;
  final VoidCallback onToggleTheme;
  final Widget child;

  const _Shell({
    required this.currentPath,
    required this.themeMode,
    required this.onToggleTheme,
    required this.child,
  });

  int get _currentIndex {
    if (currentPath.startsWith('/orders')) return 1;
    if (currentPath.startsWith('/account')) return 2;
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TechColors.background,
      body: child,
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(top: BorderSide(color: TechColors.border)),
        ),
        child: NavigationBar(
          backgroundColor: TechColors.surface,
          indicatorColor: TechColors.accent.withOpacity(0.15),
          selectedIndex: _currentIndex,
          onDestinationSelected: (i) {
            const paths = ['/explore', '/orders', '/account'];
            context.go(paths[i]);
          },
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.explore_outlined),
              selectedIcon: Icon(Icons.explore),
              label: 'Explore',
            ),
            NavigationDestination(
              icon: Icon(Icons.receipt_long_outlined),
              selectedIcon: Icon(Icons.receipt_long),
              label: 'Orders',
            ),
            NavigationDestination(
              icon: Icon(Icons.person_outline),
              selectedIcon: Icon(Icons.person),
              label: 'Account',
            ),
          ],
        ),
      ),
    );
  }
}