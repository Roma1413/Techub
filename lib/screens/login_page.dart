import 'package:flutter/material.dart';
import 'dart:math' as math;
import '../constants.dart';

class Credentials {
  final String username;
  final String password;
  Credentials(this.username, this.password);
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
                    child: FractionallySizedBox(widthFactor: 0.7,
                      child: _LoginForm(onLogIn: onLogIn)),
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
          colors: [Color(0xFF0D0D1A), Color(0xFF0A1628), TechColors.surfaceHigh],
        ),
      ),
      child: Stack(
        children: [
          // Grid pattern
          Positioned.fill(
            child: CustomPaint(painter: _GridPainter()),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 80, height: 80,
                  decoration: BoxDecoration(
                    color: TechColors.accent.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: TechColors.accent.withOpacity(0.3), width: 1.5),
                  ),
                  child: const Icon(Icons.devices, color: TechColors.accent, size: 40),
                ),
                const SizedBox(height: 24),
                const Text('TechHub', style: TextStyle(
                  color: TechColors.textPrimary, fontSize: 36, fontWeight: FontWeight.w800,
                  letterSpacing: -1,
                )),
                const SizedBox(height: 8),
                const Text('Premium Electronics, Delivered.',
                  style: TextStyle(color: TechColors.textSecondary, fontSize: 15),
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

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 3),
    vsync: this,
  )..repeat();

  @override
  void dispose() {
    _controller.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [

          /// 🔄 ROTATING ICON (this is the only real change)
          AnimatedBuilder(
            animation: _controller,
            child: const Icon(
              Icons.memory,
              color: TechColors.accent,
              size: 48,
            ),
            builder: (context, child) {
              return Transform.rotate(
                angle: _controller.value * 2 * math.pi,
                child: child,
              );
            },
          ),

          const SizedBox(height: 12),

          const Text(
            'TechHub',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: TechColors.textPrimary,
              fontSize: 28,
              fontWeight: FontWeight.w800,
              letterSpacing: -0.5,
            ),
          ),

          const SizedBox(height: 4),

          const Text(
            'Sign in to your account',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: TechColors.textSecondary,
              fontSize: 14,
            ),
          ),

          const SizedBox(height: 40),

          TextField(
            controller: _usernameController,
            style: const TextStyle(color: TechColors.textPrimary),
            decoration: const InputDecoration(
              labelText: 'Username',
              prefixIcon: Icon(Icons.person_outline,
                  color: TechColors.textMuted),
            ),
          ),

          const SizedBox(height: 16),

          TextField(
            controller: _passwordController,
            obscureText: true,
            style: const TextStyle(color: TechColors.textPrimary),
            decoration: const InputDecoration(
              labelText: 'Password',
              prefixIcon:
              Icon(Icons.lock_outline, color: TechColors.textMuted),
            ),
          ),

          const SizedBox(height: 28),

          ElevatedButton(
            onPressed: () => widget.onLogIn(
              Credentials(
                _usernameController.text,
                _passwordController.text,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: TechColors.accent,
              foregroundColor: TechColors.background,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
            ),
            child: const Text(
              'Sign In',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            ),
          ),

          const SizedBox(height: 16),

          const Text(
            'Any username & password works for demo',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: TechColors.textMuted,
              fontSize: 11,
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
