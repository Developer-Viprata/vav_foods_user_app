import 'package:flutter/material.dart';

import '../../Constants/colors.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatelessWidget {
  void Function(String?)? onSaved;
  final String? hintText;
  final double? height;
  final bool obscureText;
  String? Function(String?)? validator;
  TextEditingController? controller;
  Widget? suffixIcon;
  Widget? prefixIcon;
  int? maxLines;
  String? labelText;
  TextInputType? keyboardType;
  Widget? label;
  EdgeInsetsGeometry? contentPadding;
  TextInputAction? textInputAction;

  CustomTextFormField({
    super.key,
    this.onSaved,
    this.hintText,
    this.height,
    this.obscureText = false,
    this.validator,
    this.controller,
    this.suffixIcon,
    this.prefixIcon,
    this.maxLines,
    this.labelText,
    this.keyboardType,
    this.label,
    this.contentPadding,
    this.textInputAction,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        validator: validator,
        onSaved: onSaved,
        maxLines: maxLines ?? 1,
        textInputAction: textInputAction,
        cursorColor: green,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: const TextStyle(color: black),
          suffixIcon: suffixIcon,
          label: label,
          prefixIcon: prefixIcon,
          contentPadding: contentPadding,
          hintText: hintText,

          /* border: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: grey,
            ),
          ),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: grey,
            ),
          ), */
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: grey,
            ),
          ),

          focusColor: grey,

          //
        ),
      ),
    );
  }
}
