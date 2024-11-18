import 'package:firebase_tutorial/services/crud_services.dart';
import 'package:firebase_tutorial/widgets/cusotm_text_field.dart';
import 'package:firebase_tutorial/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({super.key});

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final locationController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Create post"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextField(
                controller: nameController,
                hintText: "Your name",
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextField(
                controller: ageController,
                hintText: "Your age",
                textInputType: TextInputType.number,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextField(
                controller: locationController,
                hintText: "Your location",
              ),
              const SizedBox(
                height: 30,
              ),
              CustomButton(
                onTap: () async {
                  Map<String, dynamic> userData = {};
                  userData['Name'] = nameController.text;
                  userData['Age'] = ageController.text;
                  userData['Location'] = locationController.text;
                  await CrudServices()
                      .insertDataToFirebase(data: userData);
                },
                buttonText: "Create",
              )
            ],
          ),
        ),
      ),
    );
  }
}
