import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({Key? key,
    required this.controller,
    required this.hintText,
    this.maxLines = 1,
  }) : super(key: key);

  final TextEditingController controller;
  final String hintText;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.cyan,
          ),
        ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.cyan,
            ),
          )
      ),
      validator: (val) {
        if (val == null || val.isEmpty){
          return ("Enter your $hintText");
        }
        return null;
      },
      maxLines: maxLines,
    );
  }
}
