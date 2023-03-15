import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({super.key});
  int days = 30;
  String name = "Sohan Monies";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Catalog App"),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Text('Welcome to $days days of flutter by $name'),
      ),
      drawer: const Drawer(
        backgroundColor: Colors.green,
      ),
    );
  }
}
