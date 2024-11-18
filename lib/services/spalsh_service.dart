import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_tutorial/screens/auth_screen/login_screen.dart';
import 'package:firebase_tutorial/screens/home_screen.dart';
import 'package:firebase_tutorial/services/auth_services.dart';
import 'package:flutter/material.dart';

class SplashService {
  Future<void> isLogin(BuildContext context) async {
    User? user = AuthServices().getCurrentUser();
    if (user != null) {
      Future.delayed(const Duration(seconds: 1), () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const HomeScreen()));
      });
    } else {
      Future.delayed(const Duration(seconds: 1), () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const LoginScreen()));
      });
    }
  }
}
