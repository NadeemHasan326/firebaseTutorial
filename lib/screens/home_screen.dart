import 'dart:developer';

import 'package:firebase_tutorial/screens/create_post_screen.dart';
import 'package:firebase_tutorial/services/auth_services.dart';
import 'package:firebase_tutorial/services/crud_services.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Stream? userDetails;

  @override
  void initState() {
    CrudServices().getAllDataFromFirebase().then((value) {
      userDetails = value;
    }).catchError((e) {
      log("Error while fetching data from firebase: $e");
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const CreatePostScreen()));
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        backgroundColor: Colors.amber,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text("Home"),
        actions: [
          IconButton(
              onPressed: () async {
                await AuthServices().loggedOut(context);
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: SingleChildScrollView(
        child: StreamBuilder(
          stream: userDetails,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text("data aa gya");
            }
            return Container();
          },
        ),
      ),
    );
  }
}
