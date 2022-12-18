import 'package:flutter/material.dart';
import 'package:foleym/routes/route.dart';
import 'package:foleym/view/widget/auth_widget/text_widget.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class Header extends StatelessWidget {
  final Widget widget;
  final String text;
  final Function() onPressed;
  const Header({
    super.key,
    required this.widget,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 3.w),
                child: Container(
                  height: 3.h,
                  width: 0.5.w,
                  color: Colors.red,
                ),
              ),
              SizedBox(
                width: 3.w,
              ),
              TextWidget(
                size: 12.sp,
                text: text,
                color: Colors.white,
              ),
              SizedBox(
                width: 20.w,
              ),
              IconButton(
                onPressed: () {
                  Get.toNamed(Routes.profileScreen);
                },
                icon: const Icon(
                  Icons.person,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
        // SizedBox(
        //   width: 50.w,
        // ),
        TextButton(
          onPressed: onPressed,
          child: widget,
        )
      ],
    );
  }
}
