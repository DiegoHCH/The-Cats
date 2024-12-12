

import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {

  static String theCatApiKey = dotenv.env['API_KEY'] ?? 'Not Api Key';
  static String theCatUrl = dotenv.env['API_URL'] ?? 'Not Api Url';
  
}