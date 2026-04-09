import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants.dart';
import '../models/models.dart';

typedef LogoutCallback = void Function(bool didLogout);

class AccountPage extends StatelessWidget {
  final User user;
  final LogoutCallback onLogOut;

  const AccountPage({super.key, required this.user, required this.onLogOut});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TechColors.background,
      appBar: AppBar(backgroundColor: TechColors.background),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          _buildProfile(),
          const SizedBox(height: 24),
          _buildStatsRow(),
          const SizedBox(height: 24),
          _buildSection('Account', [
            _menuTile(Icons.person_outline, 'Edit Profile', () {}),
            _menuTile(Icons.credit_card_outlined, 'Payment Methods', () {}),
            _menuTile(Icons.location_on_outlined, 'Saved Addresses', () {}),
          ]),
          const SizedBox(height: 16),
          _buildSection('Support', [
            _menuTile(Icons.help_outline, 'Help Center', () {}),
            _menuTile(Icons.language, 'Visit TechHub Website', () async {
              await launchUrl(Uri.parse('https://www.kodeco.com/'));
            }),
          ]),
          const SizedBox(height: 16),
          _buildSection('', [
            _menuTile(Icons.logout, 'Sign Out', () => onLogOut(true),
              color: Colors.redAccent),
          ]),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _buildProfile() {
    return Column(
      children: [
        const SizedBox(height: 8),
        Container(
          width: 88, height: 88,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: const LinearGradient(
              colors: [TechColors.accent, TechColors.accentAlt],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(color: TechColors.accent.withOpacity(0.3),
                blurRadius: 20, spreadRadius: 2),
            ],
          ),
          child: Center(
            child: Text(user.firstName[0].toUpperCase(),
              style: const TextStyle(
                color: Colors.white, fontSize: 32, fontWeight: FontWeight.w800)),
          ),
        ),
        const SizedBox(height: 14),
        Text(user.firstName, style: const TextStyle(
          color: TechColors.textPrimary, fontSize: 22, fontWeight: FontWeight.w700)),
        const SizedBox(height: 4),
        Text(user.role, style: const TextStyle(color: TechColors.textSecondary, fontSize: 14)),
        const SizedBox(height: 4),
        Text(user.email, style: const TextStyle(color: TechColors.textMuted, fontSize: 12)),
      ],
    );
  }

  Widget _buildStatsRow() {
    return Row(
      children: [
        _statCard('${user.points}', 'Points'),
        const SizedBox(width: 12),
        _statCard('Gold', 'Tier'),
        const SizedBox(width: 12),
        _statCard('12', 'Orders'),
      ],
    );
  }

  Widget _statCard(String value, String label) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: TechColors.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: TechColors.border),
        ),
        child: Column(
          children: [
            Text(value, style: const TextStyle(
              color: TechColors.accent, fontSize: 18, fontWeight: FontWeight.w800)),
            const SizedBox(height: 2),
            Text(label, style: const TextStyle(
              color: TechColors.textMuted, fontSize: 11)),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, List<Widget> tiles) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title.isNotEmpty) ...[
          Text(title, style: const TextStyle(
            color: TechColors.textMuted, fontSize: 11, fontWeight: FontWeight.w600, letterSpacing: 0.5)),
          const SizedBox(height: 8),
        ],
        Container(
          decoration: BoxDecoration(
            color: TechColors.surface,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: TechColors.border),
          ),
          child: Column(children: tiles),
        ),
      ],
    );
  }

  Widget _menuTile(IconData icon, String label, VoidCallback onTap, {Color? color}) {
    final c = color ?? TechColors.textPrimary;
    return ListTile(
      leading: Icon(icon, color: color ?? TechColors.textSecondary, size: 20),
      title: Text(label, style: TextStyle(color: c, fontSize: 14, fontWeight: FontWeight.w500)),
      trailing: color == null
          ? const Icon(Icons.chevron_right, color: TechColors.textMuted, size: 18)
          : null,
      onTap: onTap,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
    );
  }
}
