import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_tutorial/screens/auth_screen/otp_screen.dart';
import 'package:firebase_tutorial/screens/auth_screen/sign_up_screen.dart';
import 'package:firebase_tutorial/screens/home_screen.dart';
import 'package:flutter/material.dart';

class AuthServices {
  // get current user from firebase
  User? getCurrentUser() {
    final auth = FirebaseAuth.instance;
    return auth.currentUser;
  }

  // creating new user
  Future<void> signUp(BuildContext context,
      {String? email, String? password}) async {
    log("Email: $email");
    log("Password: $password");
    try {
      final auth = FirebaseAuth.instance;
      await auth.createUserWithEmailAndPassword(
          email: email!, password: password!);
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const HomeScreen()));
    } catch (e) {
      log("Error while creating new user from firebase: $e");
    }
  }

  // login in existing user
  Future<void> login(BuildContext context,
      {String? email, String? password}) async {
    log("Email: $email");
    log("Password: $password");
    try {
      final auth = FirebaseAuth.instance;
      await auth.signInWithEmailAndPassword(email: email!, password: password!);

      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const HomeScreen()));
    } catch (e) {
      log("Error while login from firebase: $e");
    }
  }

  // logout user
  Future<void> loggedOut(BuildContext context) async {
    try {
      final FirebaseAuth auth = FirebaseAuth.instance;
      await auth.signOut();
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const SignUpScreen()));
    } catch (e) {
      log("Error while loggin out user");
    }
  }

  // Forgot password
  Future<void> forgotPassword({String? email}) async {
    try {
      final auth = FirebaseAuth.instance;
      await auth.sendPasswordResetEmail(email: email!);
    } catch (e) {
      log("Error while forgot password from firebase: $e");
    }
  }

  // Login with otp
  Future<void> loginWithOtp(BuildContext context, String mobileNumber) async {
    try {
      final FirebaseAuth auth = FirebaseAuth.instance;
      await auth.verifyPhoneNumber(
          phoneNumber: mobileNumber,
          verificationCompleted: (PhoneAuthCredential credential) {},
          verificationFailed: (FirebaseAuthException exception) {},
          codeSent: (String verificationId, int? token) {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => OTPScreen(
                      verificationId: verificationId,
                    )));
          },
          codeAutoRetrievalTimeout: (String verificationId) {});
    } catch (e) {
      log("Error while loging with otp: $e");
    }
  }

  Future<void> verifyOtp({String? verificationId, String? otp}) async {
    try {
      final FirebaseAuth auth = FirebaseAuth.instance;
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId!, smsCode: otp!);
      await auth.signInWithCredential(credential);
    } catch (e) {
      log("Error while confirming otp: $e");
    }
  }
}
