import 'package:easy_pay_app/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'checkbox.dart';
import 'loginpage.dart';
import 'user_info.dart';
import 'repository/user_repository.dart';


class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {

  final textfeild_controller = TextEditingController();

  final userRepo = Get.put(UserRepository());

  late User user;
  String _name = "";
  String _email = "";
  String _phone = "";
  String _bankname = "";
  List<String> _disability = [];
  List<String> _auth_methods = [];

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
                onChanged: (val) {
                  _name = val;
                },
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Enter your name',
                ),
                keyboardType: TextInputType.name,
                style: TextStyle(
                    color: Colors.deepOrange
                ),
              ),
              SizedBox(height: 30.0,),
              Text('Email'),
              TextField(
                onChanged: (val) {
                  _email = val;
                },
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Enter your email-id',
                ),
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(
                    color: Colors.deepOrange
                ),
              ),
              SizedBox(height: 30.0,),
              Text('Mobile number'),
              TextField(
                onChanged: (val) {
                  _phone = val;
                },
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Enter your mobile number',
                ),
                keyboardType: TextInputType.phone,
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
                  onChanged: (String? val) {
                    setState(() {
                      bankDropdownValue = val!;
                    });
                    _bankname = val!;
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
                          onChanged: (bool? value) {
                            setState(() {
                              disability.val = value!;
                            });
                            _disability.add(disability.text);
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
                            _auth_methods.add(type.text);
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
                    onPressed: () async {
                      final user = User(
                          name: _name,
                          email: _email,
                          mobile_number: _phone,
                          bankname: _bankname,
                          disability: _disability,
                          authentication: _auth_methods
                      );
                      await userRepo.createUser(user);
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

