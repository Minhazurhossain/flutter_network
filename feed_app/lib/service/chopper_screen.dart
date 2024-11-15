import 'package:flutter/material.dart';
import '../service/chopper_service.dart';

class ChopperScreen extends StatelessWidget {
  final UChopperService _chopperService = UChopperService.create();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Chopper Posts')),
      body: FutureBuilder(
        future: _chopperService.fetchPosts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final posts = snapshot.data!.body as List;
            return ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final post = posts[index] as Map<String, dynamic>;
                return ListTile(
                  title: Text(post['title']),
                  subtitle: Text(post['body']),
                );
              },
            );
          }
        },
      ),
    );
  }
}
