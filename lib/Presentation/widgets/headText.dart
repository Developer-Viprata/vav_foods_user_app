import 'package:flutter/material.dart';
import 'package:vav_foods_user_app/Constants/appcolors.dart';

class HeadText extends StatefulWidget {
  const HeadText({
    super.key,
    required this.text,
    this.textSize,
    this.textColor,
    this.textWeight,
    this.textFontStyle,
    this.textHeight,
    this.textAlign,
    this.isTextOverflow,
    this.overflow,
    this.maxLines,
    this.letterSpacing,
  });
  final String text;
  final double? textSize;
  final Color? textColor;
  final FontWeight? textWeight;
  final FontStyle? textFontStyle;
  final double? textHeight;
  final TextAlign? textAlign;
  final bool? isTextOverflow;
  final TextOverflow? overflow;
  final int? maxLines;
  final double? letterSpacing;
  final String? fontfamily = "Quicksand";

  @override
  State<HeadText> createState() => _HeadTextState();
}

class _HeadTextState extends State<HeadText> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      textAlign: widget.textAlign,
      style: TextStyle(
          // height: widget.textHeight,
          fontFamily: widget.fontfamily,
          fontSize: widget.textSize ?? 11,
          letterSpacing: widget.letterSpacing,
          color: widget.textColor ?? AppColors.textcolor,
          fontWeight: widget.textWeight ?? FontWeight.w500,
          fontStyle: widget.textFontStyle,
          overflow:
              (widget.isTextOverflow ?? true) ? TextOverflow.ellipsis : null),
    );
  }
}
