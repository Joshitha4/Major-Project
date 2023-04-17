import 'package:easy_pay_app/loginpage.dart';
import 'package:flutter/material.dart';
import 'checkbox.dart';
import 'loginpage.dart';


class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {

  String bankDropdownValue = 'State Bank of India';
  List<String> banknames = [
    'State Bank of India',
    'Canara Bank',
    'Bank of Baroda',
    'Union Bank',
  ];
  List<checkBox> disability_types = [
    checkBox(text: 'blind', val: false),
    checkBox(text: 'deaf and dumb', val: false),
    checkBox(text: 'locomotor disability', val: false),
  ];


  List<checkBox> authentication_methods = [
    checkBox(text: 'fingerprint', val: false),
    checkBox(text: 'face recognition', val: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'EasyPay',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
            letterSpacing: 1.0,
            color: Colors.blue[900],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 0.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Name'),
              TextField(
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Enter your name',
                ),
                style: TextStyle(
                    color: Colors.deepOrange
                ),
              ),
              SizedBox(height: 30.0,),
              Text('Email'),
              TextField(
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Enter your email-id',
                ),
                style: TextStyle(
                    color: Colors.deepOrange
                ),
              ),
              SizedBox(height: 30.0,),
              Text('Mobile number'),
              TextField(
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Enter your mobile number',
                ),
                style: TextStyle(
                    color: Colors.deepOrange
                ),
              ),
              SizedBox(height: 30.0,),
              Text('Bankname'),
              DropdownButton(
                  value: bankDropdownValue,
                  items: banknames.map<DropdownMenuItem<String>>((String bankname) {
                    return DropdownMenuItem<String>(
                        value: bankname,
                        child: Text(
                          bankname,
                          style: TextStyle(
                              fontSize: 15.0
                          ),
                        )
                    );
                  } ).toList(),
                  onChanged: (String? updateBankname) {
                    setState(() {
                      bankDropdownValue = updateBankname!;
                    });
                  }
              ),
              SizedBox(height: 30.0,),
              Text('Disability Type'),
              Column(
                children: disability_types.map((disability) {
                  return Row(
                    children: [
                      Checkbox(
                          value: disability.val,
                          onChanged: (bool? value ) {
                            setState(() {
                              disability.val = value!;
                            });
                          }
                      ),
                      Text(disability.text),
                    ],
                  );
                }).toList(),
              ),
              SizedBox(height: 20.0,),
              Text('Authentication Type'),
              Column(
                children: authentication_methods.map((type) {
                  return Row(
                    children: [
                      Checkbox(
                          value: type.val,
                          onChanged: (bool? value ) {
                            setState(() {
                              type.val = value!;
                            });
                          }
                      ),
                      Text(type.text),
                    ],
                  );
                }).toList(),
              ),
              Center(
                child: Container(

                  color: Colors.blue[400],
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const LoginPage()),
                      );
                    },
                    child: Text(
                      'Submit',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
