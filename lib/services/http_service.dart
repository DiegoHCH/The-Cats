import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:the_cats/models/cat.dart';

class HttpService {
  HttpService._privateConstructor();
  static final HttpService _instance = HttpService._privateConstructor();
  static HttpService get instance => _instance;

  final String _apiUrl = dotenv.env['API_URL'] ?? '';
  final String _apiKey = dotenv.env['API_KEY'] ?? '';

  Future<List<Cat>> fetchBreeds() async {
    if (_apiUrl.isEmpty || _apiKey.isEmpty) {
      throw Exception('API_URL or API_KEY is not set in .env');
    }

    final response = await http.get(
      Uri.parse(_apiUrl),
      headers: {"x-api-key": _apiKey},
    );

    if (response.statusCode == 200) {
      List data = json.decode(response.body);
      return data.map((e) => Cat.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load cat breeds');
    }
  }
}