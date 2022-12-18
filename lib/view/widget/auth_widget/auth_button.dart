import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'text_widget.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final Color color;
  final Color buttonColor;
  final FontWeight? fontWeight;

  final Function() onPressed;
  const AuthButton({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.color,
    required this.buttonColor,
    this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(360, 50),
        backgroundColor: buttonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      child: TextWidget(
        color: color,
        text: text,
        fontWeight: fontWeight,
        size: 15.sp,
      ),
    );
  }
}
