import 'package:easy_pay_app/homepage.dart';
import 'package:flutter/material.dart';
import 'qrscanner.dart';
import 'homepage.dart';

class TransactionsPage extends StatelessWidget {
  const TransactionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transaction Details'),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              child: Text("Transaction sucessful!!!"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              child: const Text('Go Back to Home'),
            ),
          ],
        ),
      ),

    );
  }
}