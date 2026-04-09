class TechPost {
  final String id;
  final String profileImageUrl;
  final String username;
  final String comment;
  final String timestamp;
  final int likes;

  TechPost({
    required this.id,
    required this.profileImageUrl,
    required this.username,
    required this.comment,
    required this.timestamp,
    required this.likes,
  });
}

final List<TechPost> techPosts = [
  TechPost(id: '1', profileImageUrl: 'assets/profile_pics/person_1.jpeg', username: 'TechWithMike',
      comment: 'The new iPhone 16 Pro camera is absolutely mind-blowing. Night mode is unreal! 📸', timestamp: '5m', likes: 142),
  TechPost(id: '2', profileImageUrl: 'assets/profile_pics/person_2.jpeg', username: 'GadgetGuru',
      comment: 'Just unboxed my PS5 Pro — loading times are insane. Next-gen is finally here 🎮', timestamp: '12m', likes: 98),
  TechPost(id: '3', profileImageUrl: 'assets/profile_pics/person_3.jpeg', username: 'SarahCodes',
      comment: 'MacBook M4 Pro is handling my entire dev setup without breaking a sweat 💻', timestamp: '28m', likes: 211),
  TechPost(id: '4', profileImageUrl: 'assets/profile_pics/person_4.jpeg', username: 'AudioPhile_J',
      comment: 'Sony WH-1000XM6 vs AirPods Pro 2 — honestly the Sony wins on ANC every single time', timestamp: '45m', likes: 67),
  TechPost(id: '5', profileImageUrl: 'assets/profile_pics/person_5.jpeg', username: 'SmartHomePro',
      comment: 'Set up the full smart home ecosystem this weekend. The automation is seamless now 🏠', timestamp: '1h', likes: 55),
  TechPost(id: '6', profileImageUrl: 'assets/profile_pics/person_6.jpeg', username: 'ReviewKing',
      comment: 'Galaxy S25 Ultra S Pen experience is still unmatched. No other phone does this.', timestamp: '2h', likes: 189),
  TechPost(id: '7', profileImageUrl: 'assets/profile_pics/person_7.jpeg', username: 'ByteSized',
      comment: 'Apple Watch Ultra 2 survived my entire marathon + ocean swim. Beast mode ⌚', timestamp: '3h', likes: 304),
  TechPost(id: '8', profileImageUrl: 'assets/profile_pics/person_8.jpeg', username: 'NightOwlDev',
      comment: 'Coding session at 2am powered by caffeine and the new iPad Pro M4 keyboard 🌙', timestamp: '5h', likes: 77),
];
