import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class NetworkHandler {
  static final String _emailURL = dotenv.env['EMAIL_URL']!;
  static final bool isProduction = dotenv.env[''] == 'true';
  static final String _baseURL = dotenv.env['BASE_URL']!;
  static final String _wacURL = isProduction
      ? dotenv.env['WAC_URL']!
      : dotenv.env['WAC_URL_TESTING']!;
  static const storage = FlutterSecureStorage();

  static Future<Map<String, dynamic>>? checkKeyFirst(
    String mykey,
    String myRole,
  ) async {
    await Future.delayed(const Duration(seconds: 2));
    final hasToken = await storage.containsKey(key: mykey);
    final hasRole = await storage.read(key: myRole);
    // final showInitial = await storage.containsKey(key: "initialShow");
    return {"token": hasToken, "role": hasRole};
  }
}
