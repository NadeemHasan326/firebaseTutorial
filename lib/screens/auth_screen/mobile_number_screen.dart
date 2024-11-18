import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_tutorial/services/auth_services.dart';
import 'package:firebase_tutorial/widgets/cusotm_text_field.dart';
import 'package:firebase_tutorial/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class MobileNumberScreen extends StatefulWidget {
  const MobileNumberScreen({super.key});

  @override
  State<MobileNumberScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<MobileNumberScreen> {
  final mobileController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Mobile number")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextField(
                textInputType: TextInputType.number,
                hintText: "Enter your number",
                controller: mobileController,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomButton(
                buttonText: "Send otp",
                onTap: () async {
                  await AuthServices()
                      .loginWithOtp(context, mobileController.text);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
