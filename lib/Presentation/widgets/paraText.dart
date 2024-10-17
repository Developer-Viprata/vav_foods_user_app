
import 'package:flutter/material.dart';
import 'package:vav_foods_user_app/Constants/appcolors.dart';




class ParaText extends StatefulWidget {
  const ParaText({
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
  final String? fontfamily = "DMSans";

  @override
  State<ParaText> createState() => _ParaTextState();
}

class _ParaTextState extends State<ParaText> {
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
          color: widget.textColor ?? AppColors.secondarytext,
          fontWeight: widget.textWeight ?? FontWeight.w500,
          fontStyle: widget.textFontStyle,
          overflow:
              (widget.isTextOverflow ?? true) ? TextOverflow.ellipsis : null),
    );
  }
}