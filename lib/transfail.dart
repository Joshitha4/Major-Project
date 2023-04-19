import 'package:easy_pay_app/homepage.dart';
import 'package:flutter/material.dart';
import 'qrscanner.dart';
import 'homepage.dart';

class TransactionFailed extends StatelessWidget {
  const TransactionFailed({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transaction Failed'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              child: Text("Transaction Failed"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CamScanner()),
                );
              },
              child: const Text('Retry Payment'),
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