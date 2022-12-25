import 'package:flutter/material.dart';
import 'package:foleym/view/widget/auth_widget/auth_button.dart';
import 'package:foleym/view/widget/text_widget.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../logic/controllers/auth_controller.dart';
import '../../utils/my_string.dart';
import '../widget/auth_widget/auth_text_filed.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final formKey = GlobalKey<FormState>();
  final TextEditingController passwordController = TextEditingController();
  final controller = Get.find<AuthController>();
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Image.asset(
                'assets/images/background.jpg',
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.h, left: 5.w),
              child: TextWidget(
                size: 15.sp,
                text: 'Login',
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 25.h),
              child: Container(
                width: double.infinity,
                height: 33.h,
                padding: EdgeInsets.only(left: 4.w, right: 4.w),
                margin: EdgeInsets.only(
                  left: 4.w,
                  right: 4.w,
                ),
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    SizedBox(
                      height: 3.h,
                    ),
                    Row(
                      children: [
                        Container(
                          height: 7.h,
                          width: 15.w,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: authController.displayUserPhoto.value == ''
                                  ? const AssetImage(
                                          "assets/images/background.jpg")
                                      as ImageProvider
                                  : NetworkImage(
                                      authController.displayUserPhoto.value,
                                    ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 4.w,
                        ),
                        Column(
                          children: [
                            TextWidget(
                              size: 8.sp,
                              text: authController.displayUserName.value == ""
                                  ? 'Welcome'
                                  : authController.displayUserName.value,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                            TextWidget(
                              size: 8.sp,
                              text: '${controller.currentEmail}',
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            )
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 4.w,
                    ),
                    GetBuilder<AuthController>(
                      builder: (_) => AuthTextFiled(
                        maxLines: 1,
                        obscureText: controller.isVisibilty ? false : true,
                        controller: passwordController,
                        validator: (value) {
                          if (!RegExp(validationPassword).hasMatch(value)) {
                            return 'Password length must be 8 and contain a number,\n a special symbol, and an uppercase letter.';
                          } else {
                            return null;
                          }
                        },
                        hintText: 'PassWord',
                        suffixIcon: TextButton(
                          onPressed: () {
                            controller.Visibilty();
                          },
                          child: TextWidget(
                            size: 8.sp,
                            text: 'View',
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    GetBuilder<AuthController>(
                      builder: (_) => AuthButton(
                        text: 'Continue',
                        onPressed: () {
                          controller.loginUsingFirebase(
                            password: passwordController.text,
                          );
                          showDialog(
                            context: context,
                            builder: (context) {
                              return Center(child: CircularProgressIndicator());
                            },
                          );
                        },
                        color: Colors.black,
                        buttonColor: Color.fromARGB(144, 244, 17, 1),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: TextWidget(
                          size: 12.sp,
                          text: 'Forgot Password?',
                          color: Colors.red,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
