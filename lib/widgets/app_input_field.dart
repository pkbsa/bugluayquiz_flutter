import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppInputField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final TextDirection? textDirection;
  final List<TextInputFormatter> inputFormatters;
  final String? hintText;

  factory AppInputField.number({
    Key? key,
    required TextEditingController controller,
    String? hintText,
  }) {
    return AppInputField(
      key: key,
      controller: controller,
      keyboardType: TextInputType.number,
      inputFormatters: [],
      textDirection: TextDirection.rtl,
      hintText: hintText,
    );
  }

  const AppInputField({
    Key? key,
    required this.controller,
    this.keyboardType,
    this.inputFormatters = const [],
    this.textDirection,
    this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        keyboardType: keyboardType,
        textDirection: textDirection,
        controller: controller,
        inputFormatters: inputFormatters,
        enabled: true,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
            borderSide: BorderSide(
              color: Color.fromRGBO(0, 0, 0, 1),
              width: 2,
            ),
          ),
          hintText: hintText,
        ),
      ),
    );
  }
}
