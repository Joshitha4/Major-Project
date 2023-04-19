import 'package:flutter/material.dart';
import 'qrscanner.dart';
import 'package:firebase_database/firebase_database.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home page'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CamScanner()),
            );
          },
          child: const Text('Pay'),
        ),
      ),
    );
  }
}