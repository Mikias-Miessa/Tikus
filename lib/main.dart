import 'package:flutter/material.dart';
import 'screens/Homepage.dart';
import 'screens/networkImage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My App',
      initialRoute: '/',
      routes: {
        // '/': (context) => NetworkImageExample(),
        '/': (context) => HomePage(),
      },
    );
  }
}
