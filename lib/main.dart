import 'package:flutter/material.dart';

import 'screens/my_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'sozdar and prusha lab exam',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 204, 104, 162)),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}
