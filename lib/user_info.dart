
import 'dart:convert';

class User {

  String name = '';
  String email = '';
  String mobile_number = '';
  String bankname = '';
  List<String> disability = [];
  List<String> authentication = [];

  User({required name,
    required email,
    required mobile_number,
    required bankname,
    required disability,
    required authentication}) {
    this.name = name;
    this.email = email;
    this.mobile_number = mobile_number;
    this.bankname = bankname;
    this.disability = disability;
    this.authentication = authentication;


  }
  toJson() {
    return {
      "Fullname": this.name,
      "Email": this.email,
      "Phone": this.mobile_number,
      "bankname": this.bankname,
      "disability": jsonEncode(this.disability),
      "authentication": jsonEncode(this.authentication),
    };
  }
}