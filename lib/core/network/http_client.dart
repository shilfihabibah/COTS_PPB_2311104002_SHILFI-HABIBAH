import 'dart:convert';
import 'package:http/http.dart' as http;
import '../config/api_config.dart';

class HttpClient {
  static Future<http.Response> get(String path) {
    final uri = Uri.parse('${ApiConfig.baseUrl}$path');
    return http.get(uri, headers: ApiConfig.headers);
  }

  static Future<http.Response> post(
      String path, Map<String, dynamic> body) {
    final uri = Uri.parse('${ApiConfig.baseUrl}$path');
    return http.post(
      uri,
      headers: {
        ...ApiConfig.headers,
        'Prefer': 'return=representation',
      },
      body: jsonEncode(body),
    );
  }

  static Future<http.Response> patch(
      String path, Map<String, dynamic> body) {
    final uri = Uri.parse('${ApiConfig.baseUrl}$path');
    return http.patch(
      uri,
      headers: {
        ...ApiConfig.headers,
        'Prefer': 'return=representation',
      },
      body: jsonEncode(body),
    );
  }

  static Future<http.Response> delete(String path) {
    final uri = Uri.parse('${ApiConfig.baseUrl}$path');
    return http.delete(uri, headers: ApiConfig.headers);
  }
}
