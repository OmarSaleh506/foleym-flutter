import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../text_widget.dart';

class AuthSocialButton extends StatelessWidget {
  final String text;
  final Color color;
  final Color buttonColor;
  final Widget widget;
  final FontWeight? fontWeight;
  final Function() onPressed;
  const AuthSocialButton({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.color,
    required this.buttonColor,
    required this.widget,
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
      child: Row(
        children: [
          widget,
          SizedBox(
            width: 9.w,
          ),
          TextWidget(
            color: color,
            text: text,
            fontWeight: fontWeight,
            size: 15.sp,
          ),
        ],
      ),
    );
  }
}
