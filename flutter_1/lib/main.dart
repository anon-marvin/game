// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_1/screens/home_page.dart';
import 'package:flutter_1/screens/login_page.dart';

void main() {
  runApp(const app());
}

// ignore: camel_case_types
class app extends StatelessWidget {
  const app({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const LoginPage(),
      themeMode: ThemeMode.light,
      darkTheme: ThemeData(brightness: Brightness.dark),
    );
  }
}
