import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'constants.dart';
import 'models/models.dart';
import 'screens/screens.dart';

void main() {
  runApp(const TechHubApp());
}

class TechHubApp extends StatefulWidget {
  const TechHubApp({super.key});

  @override
  State<TechHubApp> createState() => _TechHubAppState();
}

class _TechHubAppState extends State<TechHubApp> {
  final _auth = TechHubAuth();
  final _cartManager = CartManager();
  final _orderManager = OrderManager();
  final _user = mockUser;

  bool _loggedIn = false;
  bool _initialized = false;

  late final GoRouter _router;

  @override
  void initState() {
    super.initState();

    _router = GoRouter(
      initialLocation: '/splash',
      routes: [
        // ─── SPLASH ─────────────────────────────
        GoRoute(
          path: '/splash',
          builder: (_, __) => const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ),

        // ─── LOGIN ──────────────────────────────
        GoRoute(
          path: '/login',
          builder: (_, __) => LoginPage(
            onLogIn: (creds) async {
              await _auth.signIn(creds.username, creds.password);

              setState(() => _loggedIn = true);

              _router.go('/explore');
            },
          ),
        ),

        // ─── MAIN APP SHELL ─────────────────────
        ShellRoute(
          builder: (context, state, child) {
            return _Shell(
              currentPath: state.matchedLocation,
              child: child,
            );
          },
          routes: [
            GoRoute(
              path: '/explore',
              builder: (_, __) => ExplorePage(
                cartManager: _cartManager,
                orderManager: _orderManager,
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
                onLogOut: (_) async {
                  await _auth.signOut();

                  setState(() => _loggedIn = false);

                  _router.go('/login');
                },
              ),
            ),
          ],
        ),

        // ─── DEEP LINK ─────────────────────────
        GoRoute(
          path: '/store/:id',
          builder: (context, state) {
            final id = state.pathParameters['id']!;

            final store = techStores.firstWhere(
                  (s) => s.id == id,
              orElse: () => techStores.first,
            );

            return StorePage(
              store: store,
              cartManager: _cartManager,
              ordersManager: _orderManager,
            );
          },
        ),
      ],

      // ─── GLOBAL REDIRECT LOGIC ───────────────
      redirect: (context, state) {
        final location = state.matchedLocation;

        final isGoingToLogin = location == '/login';
        final isSplash = location == '/splash';

        // Wait until auth is ready
        if (!_initialized) return '/splash';

        // Not logged in → force login
        if (!_loggedIn && !isGoingToLogin) {
          return '/login';
        }

        // Logged in → prevent going back to login
        if (_loggedIn && isGoingToLogin) {
          return '/explore';
        }

        // Remove splash after init
        if (_initialized && isSplash) {
          return _loggedIn ? '/explore' : '/login';
        }

        return null;
      },
    );

    _initAuth();
  }

  Future<void> _initAuth() async {
    final loggedIn = await _auth.loggedIn;

    if (!mounted) return;

    setState(() {
      _loggedIn = loggedIn;
      _initialized = true;
    });

    // Navigate after initialization
    _router.go(loggedIn ? '/explore' : '/login');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'TechHub',
      theme: techHubTheme(),
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
    );
  }
}



class _Shell extends StatelessWidget {
  final String currentPath;
  final Widget child;

  const _Shell({
    required this.currentPath,
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
          border: Border(
            top: BorderSide(color: TechColors.border),
          ),
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