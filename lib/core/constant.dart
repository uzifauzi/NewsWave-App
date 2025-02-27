import 'package:flutter_dotenv/flutter_dotenv.dart';

class KeyConstant {
  static String apiKey = dotenv.env['API_KEY'] ?? "";
  static String idCountry = dotenv.env['COUNTRY'] ?? "";
  static String topCategory = dotenv.env['TOP_CATEGORY'] ?? "";
  static String sportsCategory = dotenv.env['SPORTS_CATEGORY'] ?? "";
  static String techCategory = dotenv.env['TECH_CATEGORY'] ?? "";
}
