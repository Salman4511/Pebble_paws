import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_my_dog/screens/authentication/loginorsignup.dart';
import 'package:flutter_my_dog/screens/Others/navbar.dart';

class authpage extends StatelessWidget {
  const authpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(stream: FirebaseAuth.instance.authStateChanges(),
       builder:( BuildContext context, AsyncSnapshot<User?> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting){
          return const CircularProgressIndicator();
        } else {
          if(snapshot.hasData){
           
            return navPage();

          }else {
            return const LoginorSignup();
          }
         
        }
       }),
    );
  }
}