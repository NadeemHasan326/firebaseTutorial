import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final TextInputType? textInputType;
  const CustomTextField(
      {super.key, this.controller, this.hintText, this.textInputType});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
      child: TextFormField(
        keyboardType: textInputType ?? TextInputType.phone,
        validator: (value) {
          if (value?.isNotEmpty ?? false) {
            return null;
          }
          return "$hintText should not be null";
        },
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            contentPadding: const EdgeInsets.only(left: 20, right: 20)),
        controller: controller,
      ),
    );
  }
}
