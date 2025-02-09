import 'package:flutter_dotenv/flutter_dotenv.dart';

class KeyConstant {
  static String apiKey = dotenv.env['API_KEY'] ?? "";
  static const idCountry = "id";
}
