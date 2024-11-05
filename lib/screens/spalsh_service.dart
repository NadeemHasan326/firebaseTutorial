import 'package:firebase_tutorial/screens/auth_screen/login_screen.dart';
import 'package:flutter/material.dart';

class SplashService {
  void isLogin(BuildContext context) {
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const LoginScreen()));
    });
  }
}
