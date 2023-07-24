import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvUtils {
  static Future init() async {
    await dotenv.load();
  }

  static String? fetchAPI() {
    return dotenv.env['API_KEY'];
  }
}
