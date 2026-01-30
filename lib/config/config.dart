// config.dart
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Config {
  static Future<void> load() async {
    await dotenv.load();
  }

  static String get baseURL {
    return dotenv.env['BASE_URL']!;
  }

  static String get emailURL {
    return dotenv.env['EMAIL_URL']!;
  }

  // Add more getters for other environment variables here
}
