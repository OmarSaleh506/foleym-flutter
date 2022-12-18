import 'package:flutter/material.dart';
import 'package:foleym/routes/route.dart';
import 'package:foleym/view/widget/auth_widget/auth_button.dart';
import 'package:foleym/view/widget/auth_widget/text_widget.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../logic/controllers/auth_controller.dart';
import '../../utils/my_string.dart';
import '../widget/auth_widget/auth_social_button.dart';
import '../widget/auth_widget/auth_text_filed.dart';

class HiScreen extends StatelessWidget {
  HiScreen({super.key});
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final controller = Get.find<AuthController>();

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
              padding: EdgeInsets.only(top: 10.h, left: 5.w),
              child: TextWidget(
                size: 15.sp,
                text: 'Hi!',
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15.h),
              child: Container(
                width: double.infinity,
                height: 55.h,
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
                    SizedBox(
                      height: 2.h,
                    ),
                    AuthTextFiled(
                      controller: emailController,
                      obscureText: false,
                      validator: (value) {
                        if (!RegExp(validationEmail).hasMatch(value)) {
                          return 'Enter valid Email';
                        } else {
                          return null;
                        }
                      },
                      hintText: 'Email',
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    GetBuilder<AuthController>(
                      builder: (_) => AuthButton(
                        text: 'Continue',
                        onPressed: () async {
                          await controller
                              .checkEmailOnFirebase(emailController);
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
                    SizedBox(
                      height: 2.h,
                    ),
                    Align(
                      child: TextWidget(
                        size: 15.sp,
                        text: 'or',
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    AuthSocialButton(
                      text: 'Continue With Phone',
                      onPressed: () {},
                      color: Colors.black,
                      buttonColor: Color.fromARGB(144, 244, 17, 1),
                      widget: const Icon(
                        Icons.phone,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    GetBuilder<AuthController>(
                      builder: (_) => (AuthSocialButton(
                        text: 'Continue With Google',
                        onPressed: () async {
                          await controller.loginUsinggoogle();
                          showDialog(
                            context: context,
                            builder: (context) {
                              return Center(child: CircularProgressIndicator());
                            },
                          );
                        },
                        color: Colors.black,
                        buttonColor: Color.fromARGB(144, 244, 17, 1),
                        widget: Image.asset(
                          'assets/images/google_image.png',
                          color: Colors.black,
                        ),
                      )),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    AuthSocialButton(
                      text: 'Continue With Apple',
                      onPressed: () {},
                      color: Colors.black,
                      buttonColor: Color.fromARGB(144, 244, 17, 1),
                      widget: Image.asset(
                        'assets/images/apple_image.png',
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Row(
                      children: [
                        TextWidget(
                          size: 12.sp,
                          text: 'Don`t have an account?',
                          color: Colors.white.withOpacity(0.8),
                        ),
                        SizedBox(
                          width: 2.sp,
                        ),
                        TextButton(
                          onPressed: () {
                            Get.toNamed(Routes.signUpScreen);
                          },
                          child: TextWidget(
                            size: 12.sp,
                            text: 'Sign up',
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
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
