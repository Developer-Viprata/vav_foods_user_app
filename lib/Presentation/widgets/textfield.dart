import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vav_foods_user_app/Constants/appcolors.dart';


class CustomTextField extends StatefulWidget {
  final TextAlignVertical? textalignVertical;
  final EdgeInsetsGeometry? contentPadding;
  final TextEditingController? controller;
  final Color? cursorColor;
  final IconData? prefix;
  final IconButton? suffixIcon;
  final String? hintText;
  final Widget? labelText;
  bool? isObsecre;
  bool? focus;
  bool? enabled;
  bool? readOnly;
  final TextInputType? textInputType;
  final List<TextInputFormatter>? inputFormatter;
  final FormFieldValidator<String>? validator;
  void Function(String)? onChanged;
  String? errorText;
  final InputBorder? border;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final InputBorder? errorBorder;
  final InputBorder? disabledBorder;
  final int? maxlength;
  final VoidCallback? onTap;
  final TextStyle? textStyle;
  final String? initialValue;

  CustomTextField({
    super.key,
    this.textalignVertical,
    this.contentPadding,
    this.controller,
    this.cursorColor,
    this.prefix,
    this.suffixIcon,
    this.hintText,
    this.isObsecre = false,
    this.enabled = true,
    this.textInputType,
    this.validator,
    this.inputFormatter,
    this.onChanged,
    this.errorText,
    this.labelText,
    this.border,
    this.enabledBorder,
    this.focusedBorder,
    this.errorBorder,
    this.disabledBorder,
    this.maxlength,
    this.focus = false,
    this.readOnly,
    this.onTap,
    this.textStyle,
    this.initialValue
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: TextFormField(
        initialValue: widget.initialValue,
        cursorColor: AppColors.secondarytext,
        style: /* widget.textStyle */TextStyle(fontFamily: "Quicksand" ),
        onTap: widget.onTap ?? () {},
        readOnly: widget.readOnly ?? false,
        autofocus: widget.focus!,
        maxLength: widget.maxlength,
        inputFormatters: widget.inputFormatter,
        keyboardType: widget.textInputType,
        enabled: widget.enabled,
        controller: widget.controller,
        obscureText: widget.isObsecre!,
        validator: widget.validator,
        onChanged: widget.onChanged,
        textAlignVertical: widget.textalignVertical,
        decoration: InputDecoration(
          suffixIcon:widget.suffixIcon,
          hintText: widget.hintText,
          hintStyle: const TextStyle(color: Colors.grey),

          // Border settings: only bottom border is visible in grey
          enabledBorder: const UnderlineInputBorder(
            
            borderSide: BorderSide(
                color: Colors.grey, width: 1), // Only bottom grey border
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
                color: Colors.grey,
                width: 1), // Bottom border changes when focused
          ),
          // To make no other borders
          border: InputBorder.none,
        ),
      ),
    );
  }
}
