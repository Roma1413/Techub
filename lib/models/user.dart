import 'package:firebase_auth/firebase_auth.dart' as auth;

class User {
  final String id;
  /// Shown on profile, reviews, and signup; synced with Firebase displayName.
  final String username;
  final String firstName;
  final String lastName;
  final String email;
  final String role;
  final int points;
  final String profileImageUrl;

  User({
    required this.id,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.role,
    required this.points,
    required this.profileImageUrl,
  });

  factory User.fromAuthUser(auth.User u) {
    final name = _usernameFromAuthUser(u);
    return User(
      id: u.uid,
      username: name,
      firstName: name,
      lastName: '',
      email: u.email ?? '',
      role: 'Tech Enthusiast',
      points: 4200,
      profileImageUrl: 'assets/profile_pics/user_avatar.png',
    );
  }
}

String _usernameFromAuthUser(auth.User u) {
  final d = u.displayName?.trim();
  if (d != null && d.isNotEmpty) return d;
  final e = u.email?.trim();
  if (e != null && e.contains('@')) return e.split('@').first;
  return 'User';
}
