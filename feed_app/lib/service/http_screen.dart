import 'package:flutter/material.dart';
import '../service/http_service.dart';

class HttpScreen extends StatelessWidget {
  final HttpService _httpService = HttpService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('HTTP Posts')),
      body: FutureBuilder(
        future: _httpService.fetchPosts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final posts = snapshot.data as List<Map<String, dynamic>>;
            return ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(posts[index]['title']),
                  subtitle: Text(posts[index]['body']),
                );
              },
            );
          }
        },
      ),
    );
  }
}
