import 'package:easy_pay_app/authentication_page.dart';
import 'package:flutter/material.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'loginpage.dart';
import 'authentication_page.dart';
import 'package:permission_handler/permission_handler.dart';

class CamScanner extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _CamScanner(); //create state
  }
}

class _CamScanner extends State<CamScanner>{
  String? scanresult = ''; //varaible for scan result text

  @override
  void initState() {
    scanresult = "none"; //innical value of scan result is "none"
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title:Text("QR code Scanner"),
          backgroundColor: Colors.redAccent,
      ),
      body:Container(
          alignment: Alignment.topCenter, //inner widget alignment to center
          padding: EdgeInsets.all(20),
          child:Column(
            children:[
              Container(
                  child: Text("Scan Result: " + scanresult.toString())
              ),
              Container(
                margin: EdgeInsets.only(top:30),
                child: (scanresult != "none" && scanresult != null && scanresult != "null")?ElevatedButton(
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Auth()),
                    );
                  } ,
                  child: Text("Proceed with Payment?"),
                ):ElevatedButton( //button to start scanning
                    onPressed: () async {
                      if (await Permission.camera.request().isGranted) {
                        scanresult = await scanner.scan();
                      }
                      else{
                        const Text("Please Grant Permission");
                      }
                      setState(() { //refresh UI to show the result on app
                      });

                      //code to open camera and start scanning,
                      //the scan result is stored to "scanresult" varaible.

                    },
                    child: Text("Scan QR Code")
                ),
              ),
            ],
          ),
      ),
    );
  }
}

