import 'dart:convert';
import 'package:http/http.dart' as http;

class HttpHelper {
  static Future<Map<String, dynamic>> get(String url) async {
    final response = await http.get(Uri.parse(url));
    return json.decode(response.body) as Map<String, dynamic>;
  }
}
