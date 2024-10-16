import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyText extends StatelessWidget {
  String text;
  double? fontSize;
  Color? color;
  FontWeight? fontWeight;
  TextAlign? textAlign;
  TextOverflow? overflow;
  int? maxLines;
  TextDecoration? decoration;
  Color? decorationColor;
  MyText({
    super.key,
    required this.text,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.decoration,
    this.decorationColor,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color ?? Colors.black,
        fontSize: fontSize,
        fontWeight: fontWeight,
        overflow: overflow ?? TextOverflow.ellipsis,
        decoration: decoration,
        decorationColor: decorationColor,
      ),
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign ?? TextAlign.start,
    );
  }
}
