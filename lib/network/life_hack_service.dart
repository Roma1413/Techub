import 'dart:convert';
import 'package:http/http.dart' as http;

class LifeHack {
  final String title;
  final String description;

  LifeHack({required this.title, required this.description});

  factory LifeHack.fromJson(Map<String, dynamic> json) => LifeHack(
    title: json['title'] ?? 'Tip',
    description: json['description'] ?? '',
  );
}

class LifeHackService {
  static const _apiKey = 'c0ddc6bba8914048b3feade9fdd1bb20'; // ← paste your key
  static const _url = 'https://api.apileague.com/retrieve-random-life-hack';

  Future<LifeHack?> fetchHack() async {
    try {
      final uri = Uri.parse('$_url?max-length=200');
      print('Fetching: $uri'); // ← see if request even starts
      final response = await http.get(
        uri,
        headers: {'x-api-key': _apiKey},
      );
      print('Status: ${response.statusCode}'); // ← see what comes back
      print('Body: ${response.body}');

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body) as Map<String, dynamic>;
        return LifeHack.fromJson(json);
      }
      return null;
    } catch (e) {
      print('LifeHack error: $e'); // ← already seeing this
      return null;
    }
  }
}