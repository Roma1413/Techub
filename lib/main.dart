import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'constants.dart';
import 'models/models.dart';
import 'screens/screens.dart';

void main() => runApp(const TechHubApp());

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

  late final GoRouter _router;

  @override
  void initState() {
    super.initState();
    _router = GoRouter(
      initialLocation: '/explore',
      redirect: (context, state) async {
        final loggedIn = await _auth.loggedIn;
        final onLogin = state.matchedLocation == '/login';
        if (!loggedIn && !onLogin) return '/login';
        if (loggedIn && onLogin) return '/explore';
        return null;
      },
      routes: [
        GoRoute(
          path: '/login',
          builder: (_, __) => LoginPage(
            onLogIn: (creds) async {
              await _auth.signIn(creds.username, creds.password);
              if (mounted) _router.go('/explore');
            },
          ),
        ),
        ShellRoute(
          builder: (context, state, child) => _Shell(
            currentPath: state.matchedLocation,
            child: child,
          ),
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
              builder: (_, __) => MyOrdersPage(orderManager: _orderManager),
            ),
            GoRoute(
              path: '/account',
              builder: (_, __) => AccountPage(
                user: _user,
                onLogOut: (_) async {
                  await _auth.signOut();
                  _router.go('/login');
                },
              ),
            ),
          ],
        ),
        // Store detail — outside ShellRoute (no bottom nav)
        GoRoute(
          path: '/store/:id',
          builder: (context, state) {
            final id = state.pathParameters['id']!;
            final store = techStores.firstWhere((s) => s.id == id,
              orElse: () => techStores.first);
            return StorePage(
              store: store,
              cartManager: _cartManager,
              ordersManager: _orderManager,
            );
          },
        ),
      ],
    );
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

// ─── Bottom Nav Shell ─────────────────────────────────────────────────────────

class _Shell extends StatelessWidget {
  final String currentPath;
  final Widget child;

  const _Shell({required this.currentPath, required this.child});

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
            final paths = ['/explore', '/orders', '/account'];
            context.go(paths[i]);
          },
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.explore_outlined, color: TechColors.textMuted),
              selectedIcon: Icon(Icons.explore, color: TechColors.accent),
              label: 'Explore',
            ),
            NavigationDestination(
              icon: Icon(Icons.receipt_long_outlined, color: TechColors.textMuted),
              selectedIcon: Icon(Icons.receipt_long, color: TechColors.accent),
              label: 'Orders',
            ),
            NavigationDestination(
              icon: Icon(Icons.person_outline, color: TechColors.textMuted),
              selectedIcon: Icon(Icons.person, color: TechColors.accent),
              label: 'Account',
            ),
          ],
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        ),
      ),
    );
  }
}
