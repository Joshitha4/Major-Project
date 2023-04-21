import 'package:easy_pay_app/transdetails.dart';
import 'package:easy_pay_app/transfail.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:local_auth/error_codes.dart' as error_code;
import 'package:local_auth/local_auth.dart';
import 'package:local_auth_android/local_auth_android.dart';
import 'package:local_auth_ios/local_auth_ios.dart';
import 'transdetails.dart';
import 'transfail.dart';



class Auth extends StatefulWidget {
  const Auth({super.key});

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  bool isDeviceSupport = false;
  List<BiometricType>? availableBiometrics;
  LocalAuthentication? auth;

  @override
  void initState() {
    super.initState();

    auth = LocalAuthentication();

    deviceCapability();
    _getAvailableBiometrics();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }

  Future<void> _getAvailableBiometrics() async {
    try {
      availableBiometrics = await auth?.getAvailableBiometrics();
      print("bioMetric: $availableBiometrics");

      if (availableBiometrics!.contains(BiometricType.strong) || availableBiometrics!.contains(BiometricType.fingerprint)) {
        final bool didAuthenticate = await auth!.authenticate(
            localizedReason: 'Please authenticate yourself with face, or fingerprint',
            options: const AuthenticationOptions(biometricOnly: true, stickyAuth: true),
            authMessages: const <AuthMessages>[
              AndroidAuthMessages(
                signInTitle: 'Proceed with payment',
                cancelButton: 'No thanks',
              ),
              IOSAuthMessages(
                cancelButton: 'No thanks',
              ),
            ]);
        if(didAuthenticate){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const TransactionsPage()),
          );
        }
        if (!didAuthenticate) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const TransactionFailed()),
          );
        }
      } else if (availableBiometrics!.contains(BiometricType.weak) || availableBiometrics!.contains(BiometricType.face)) {
        final bool didAuthenticate = await auth!.authenticate(
            localizedReason: 'Authenticate yourself with face, or fingerprint',
            options: const AuthenticationOptions(stickyAuth: true),
            authMessages: const <AuthMessages>[
              AndroidAuthMessages(
                signInTitle: 'Proceed with payment',
                cancelButton: 'No thanks',
              ),
              IOSAuthMessages(
                cancelButton: 'No thanks',
              ),
            ]);
        if(didAuthenticate){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const TransactionsPage()),
          );
        }
        if (!didAuthenticate) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const TransactionFailed()),
          );
        }
      }
    } on PlatformException catch (e) {
      // availableBiometrics = <BiometricType>[];
      if (e.code == error_code.passcodeNotSet) {
        exit(0);
      }
      print("error: $e");
    }
  }

  void deviceCapability() async {
    final bool isCapable = await auth!.canCheckBiometrics;
    isDeviceSupport = isCapable || await auth!.isDeviceSupported();
  }
}