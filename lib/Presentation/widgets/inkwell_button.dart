
import 'package:flutter/material.dart';
import 'package:vav_foods_user_app/Constants/appcolors.dart';
import 'package:vav_foods_user_app/Presentation/widgets/mytext.dart';

class InkWellButton extends StatefulWidget {
  final String text;
  final Function() onPressed;
  const InkWellButton({super.key, required this.text, required this.onPressed});

  @override
  State<InkWellButton> createState() => _InkWellButtonState();
}

class _InkWellButtonState extends State<InkWellButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
       height: 57,
          width: 342,
          decoration: BoxDecoration(
            color: AppColors.primarygreen,
            borderRadius: BorderRadius.circular(12),
          ),
      child: InkWell(
        onTap: (){
          widget.onPressed();
        },
       child: Center(child: HeadText(text: widget.text,textColor: Colors.white,textSize: 18,),
        ),
      ),
    );
  }
}