import 'package:flutter/material.dart';
import 'dart:math' as math;
import '../constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Credentials {
  final String email;
  final String password;
  Credentials(this.email, this.password);
}

class LoginPage extends StatelessWidget {
  final ValueChanged<Credentials> onLogIn;

  const LoginPage({super.key, required this.onLogIn});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TechColors.background,
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 700) {
            return Row(
              children: [
                Expanded(child: _buildHero()),
                Expanded(
                  child: Center(
                    child: FractionallySizedBox(
                      widthFactor: 0.7,
                      child: _LoginForm(onLogIn: onLogIn),
                    ),
                  ),
                ),
              ],
            );
          }
          return _LoginForm(onLogIn: onLogIn);
        },
      ),
    );
  }

  Widget _buildHero() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF0D0D1A),
            Color(0xFF0A1628),
            TechColors.surfaceHigh
          ],
        ),
      ),
      child: Stack(
        children: [
          Positioned.fill(child: CustomPaint(painter: _GridPainter())),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.devices,
                    color: TechColors.accent, size: 60),
                SizedBox(height: 20),
                Text(
                  'TechHub',
                  style: TextStyle(
                    color: TechColors.textPrimary,
                    fontSize: 36,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Premium Electronics, Delivered.',
                  style: TextStyle(color: TechColors.textSecondary),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _LoginForm extends StatefulWidget {
  final ValueChanged<Credentials> onLogIn;

  const _LoginForm({required this.onLogIn});

  @override
  State<_LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<_LoginForm>
    with TickerProviderStateMixin {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _usernameController = TextEditingController();

  bool _isLoading = false;
  /// When true, show username and primary action is account creation.
  bool _creatingAccount = false;

  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 3),
    vsync: this,
  )..repeat();

  @override
  void dispose() {
    _controller.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
    super.dispose();
  }

  bool _validate() {
    if (_emailController.text.trim().isEmpty ||
        _passwordController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill all fields")),
      );
      return false;
    }
    return true;
  }

  bool _validateRegister() {
    if (!_validate()) return false;
    if (_usernameController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please choose a username')),
      );
      return false;
    }
    return true;
  }

  Future<void> _login() async {
    if (!_validate()) return;

    setState(() => _isLoading = true);

    try {
      await _auth.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      widget.onLogIn(
        Credentials(
          _emailController.text,
          _passwordController.text,
        ),
      );
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.message ?? "Login failed")),
      );
    }

    setState(() => _isLoading = false);
  }

  Future<void> _register() async {
    if (!_validateRegister()) return;

    setState(() => _isLoading = true);

    try {
      final cred = await _auth.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      final name = _usernameController.text.trim();
      await cred.user?.updateDisplayName(name);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Account created successfully")),
        );
      }

      widget.onLogIn(
        Credentials(
          _emailController.text,
          _passwordController.text,
        ),
      );
    } on FirebaseAuthException catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.message ?? "Registration failed")),
        );
      }
    }

    if (mounted) setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          AnimatedBuilder(
            animation: _controller,
            child: const Icon(Icons.memory,
                color: TechColors.accent, size: 48),
            builder: (context, child) {
              return Transform.rotate(
                angle: _controller.value * 2 * math.pi,
                child: child,
              );
            },
          ),

          const SizedBox(height: 20),

          Text(
            _creatingAccount ? "Create your account" : "Sign in to TechHub",
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: TechColors.textPrimary,
            ),
          ),

          const SizedBox(height: 30),

          if (_creatingAccount) ...[
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: "Username",
                prefixIcon: Icon(Icons.person_outline),
              ),
            ),
            const SizedBox(height: 15),
          ],

          TextField(
            controller: _emailController,
            decoration: const InputDecoration(
              labelText: "Email",
              prefixIcon: Icon(Icons.email),
            ),
          ),

          const SizedBox(height: 15),

          TextField(
            controller: _passwordController,
            obscureText: true,
            decoration: const InputDecoration(
              labelText: "Password",
              prefixIcon: Icon(Icons.lock),
            ),
          ),

          const SizedBox(height: 25),

          ElevatedButton(
            onPressed: _isLoading
                ? null
                : (_creatingAccount ? _register : _login),
            child: _isLoading
                ? const CircularProgressIndicator()
                : Text(_creatingAccount ? "Create Account" : "Sign In"),
          ),

          const SizedBox(height: 10),

          TextButton(
            onPressed: _isLoading
                ? null
                : () => setState(() {
                      _creatingAccount = !_creatingAccount;
                    }),
            child: Text(
              _creatingAccount
                  ? "Already have an account? Sign in"
                  : "Create an account",
              style: const TextStyle(color: TechColors.accent),
            ),
          ),
        ],
      ),
    );
  }
}

class _GridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = TechColors.border.withOpacity(0.4)
      ..strokeWidth = 0.5;

    const step = 40.0;

    for (double x = 0; x < size.width; x += step) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }

    for (double y = 0; y < size.height; y += step) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(_) => false;
}