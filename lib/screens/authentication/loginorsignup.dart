import 'package:flutter/material.dart';
import 'package:flutter_my_dog/screens/authentication/loginscreen.dart';
import 'package:flutter_my_dog/screens/authentication/signuppage.dart';

class LoginorSignup extends StatefulWidget {
  const LoginorSignup({super.key});

  @override
  State<LoginorSignup> createState() => _LoginorSignupState();
}

class _LoginorSignupState extends State<LoginorSignup> {
  bool islogin = true;
  void tooglepage(){
    setState(() {
          islogin = !islogin;

    });
  }
  @override
  Widget build(BuildContext context) {
    if (islogin){
      return loginscreen(onPressed: () { 
        tooglepage();
       },);
    } else {
      return signUppage(onPressed: () { 
        tooglepage();
       },);
    }
  }
}