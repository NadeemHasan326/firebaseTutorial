import 'dart:developer';

import 'package:firebase_tutorial/screens/auth_screen/sign_up_screen.dart';
import 'package:firebase_tutorial/widgets/cusotm_text_field.dart';
import 'package:firebase_tutorial/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Login",
          style: TextStyle(color: Colors.white),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Form(
                key: formKey,
                child: Column(
                  children: [
                    CustomTextField(
                      controller: emailController,
                      hintText: "Email",
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomTextField(
                      controller: passwordController,
                      hintText: "Password",
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              CustomButton(
                buttonText: "Login",
                onTap: () {
                  if (formKey.currentState?.validate() ?? false) {
                    log("success ho gya bhai");
                  }
                },
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  const Text("Don't have an account"),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const SignUpScreen()));
                      },
                      child: const Text("Sign up"))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
