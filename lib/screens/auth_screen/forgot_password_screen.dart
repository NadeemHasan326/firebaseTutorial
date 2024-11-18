import 'package:firebase_tutorial/services/auth_services.dart';
import 'package:firebase_tutorial/widgets/cusotm_text_field.dart';
import 'package:firebase_tutorial/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final forgotPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Forgot password")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextField(
                hintText: "Email",
                controller: forgotPasswordController,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomButton(
                buttonText: "Send email",
                onTap: () async {
                 await AuthServices()
                      .forgotPassword(email: forgotPasswordController.text);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
