import 'package:flutter/material.dart';
import 'service/http_screen.dart';
import 'service/chopper_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Networking App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Networking App')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text('HTTP Posts'),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => HttpScreen()));
              },
            ),
            ElevatedButton(
              child: Text('Chopper Posts'),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => ChopperScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
