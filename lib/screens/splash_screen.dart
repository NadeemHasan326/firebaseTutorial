import 'package:firebase_tutorial/services/spalsh_service.dart';
import 'package:flutter/material.dart';

class SlashScreen extends StatelessWidget {
  const SlashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SplashService().isLogin(context);
    return const Scaffold(
      body: Center(
        child: Text(
          "Firebase Tutorial",
          style: TextStyle(fontSize: 30, color: Colors.amber),
        ),
      ),
    );
  }
}
