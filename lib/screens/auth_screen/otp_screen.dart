import 'package:firebase_tutorial/services/auth_services.dart';
import 'package:firebase_tutorial/widgets/cusotm_text_field.dart';
import 'package:firebase_tutorial/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class OTPScreen extends StatefulWidget {
  final String? verificationId;
  const OTPScreen({super.key, this.verificationId});

  @override
  State<OTPScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<OTPScreen> {
  final otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("OTP")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextField(
                textInputType: TextInputType.number,
                hintText: "Enter OTP",
                controller: otpController,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomButton(
                buttonText: "Verify OTP",
                onTap: () async {
                  await AuthServices().verifyOtp(
                      verificationId: widget.verificationId,
                      otp: otpController.text);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
