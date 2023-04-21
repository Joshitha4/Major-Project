
import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'loginpage.dart';
import 'user_info.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash Screen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                LoginPage()
            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child:Image.asset('assets/easypaylogo.png')
        // child:FlutterLogo(size:MediaQuery.of(context).size.height)
    );
  }
}
