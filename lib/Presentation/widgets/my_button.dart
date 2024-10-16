// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../../Constants/colors.dart';
import 'my_text.dart';

class MyButton extends StatelessWidget {
  void Function()? onPressed;
  String text;
  double? height;
  double? minWidth;
  MyButton({
    super.key,
    this.onPressed,
    required this.text,
    this.height,
    this.minWidth,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: greencolor,
      minWidth: minWidth,
      height: 70,
      onPressed: onPressed,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: MyText(
        text: text,
        color: white,
      ),
    );
  }
}
