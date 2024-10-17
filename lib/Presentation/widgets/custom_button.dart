import 'package:flutter/material.dart';
import 'package:vav_foods_user_app/Presentation/widgets/mytext.dart';

class CustomButton extends StatefulWidget {
  final String text;
  final Function() onPressed;
  const CustomButton({super.key, required this.text, required this.onPressed});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  get primarygreen => null;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      minWidth: 342,
      height: 57,
      color: primarygreen,
      onPressed: (){
          widget.onPressed();
      }, child: HeadText(text: widget.text,textColor: Colors.white,textSize: 18,));
  }
}