import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final String? hintText;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final TextInputType? typeInput;
  final String? Function(String)? onChanged;

  // final bool enabled;
  final TextEditingController? controller;
  const CustomTextField({
    super.key,
    required this.labelText,
    this.hintText = '',
    this.maxLength,
    this.inputFormatters,
    this.validator,
    this.typeInput,
    this.controller,
    this.onChanged,
    // required this.enabled,
  });

  @override
  Widget build(BuildContext context) {
    final outlineInputBorder = UnderlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(color: Colors.transparent));
    return TextFormField(
      onChanged: (value) => onChanged!(value),
      controller: controller,
      // enabled: enabled,
      keyboardType: typeInput,
      validator: validator,
      maxLength: maxLength,
      inputFormatters: inputFormatters,
      style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Colors.black,
          letterSpacing: 0.75),
      decoration: InputDecoration(
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: const Color(0xffEB5757).withOpacity(0.15),
        )),
        errorStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w300,
          color: Color(0xffEB5757),
        ),
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        fillColor: const Color(0xffF6F6F9),
        hintText: hintText,
        hintStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Color(0xffA9ABB7),
            letterSpacing: 1),
        filled: true,
        label: Text(labelText),
        labelStyle: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w400,
            color: Color(0xffA9ABB7)),
      ),
    );
  }
}

extension extString on String {
  bool get isValidEmail {
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailRegExp.hasMatch(this);
  }

  bool get isValidName {
    final nameRegExp =
        RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$");
    return nameRegExp.hasMatch(this);
  }

  bool get isValidPassword {
    final passwordRegExp = RegExp(
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\><*~]).{8,}/pre>');
    return passwordRegExp.hasMatch(this);
  }

  bool get isNotNull {
    return this != null;
  }

  bool get isValidPhone {
    final phoneRegExp =
        RegExp(r'^\s*(?:\+?(\d{1,3}))?\(\d{3}\)\d{3}-\d{2}-\d{2}$');
    return phoneRegExp.hasMatch(this);
  }
}
