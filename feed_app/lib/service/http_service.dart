import 'dart:convert';
import 'package:http/http.dart' as http;

class HttpService {
  final String baseUrl = 'https://jsonplaceholder.typicode.com/posts';

  Future<List<Map<String, dynamic>>> fetchPosts() async {
    final response = await http.get(
      Uri.parse(baseUrl),
      headers: {
        'Custom-Header': 'HttpPackage',
      },
    );

    if (response.statusCode == 200) {
      final List data = json.decode(response.body);
      return data.cast<Map<String, dynamic>>();
    } else {
      throw Exception('Failed to load posts');
    }
  }
}
