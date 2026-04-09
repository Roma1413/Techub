class User {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String role;
  final int points;
  final String profileImageUrl;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.role,
    required this.points,
    required this.profileImageUrl,
  });
}

final mockUser = User(
  id: '1',
  firstName: 'Alex',
  lastName: 'Chen',
  email: 'alex.chen@techhub.com',
  role: 'Tech Enthusiast',
  points: 4200,
  profileImageUrl: 'assets/profile_pics/user_avatar.png',
);
