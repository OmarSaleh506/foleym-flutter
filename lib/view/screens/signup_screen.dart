import 'package:flutter/material.dart';
import 'package:foleym/view/widget/auth_widget/auth_button.dart';
import 'package:foleym/view/widget/auth_widget/text_widget.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../logic/controllers/auth_controller.dart';
import '../../utils/my_string.dart';
import '../widget/auth_widget/auth_text_filed.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});
  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
              padding: EdgeInsets.only(top: 21.h, left: 5.w),
              child: TextWidget(
                size: 15.sp,
                text: 'SignUp',
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 25.h),
              child: Container(
                width: double.infinity,
                height: 40.h,
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
                    Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: TextWidget(
                            size: 9.sp,
                            text:
                                'Looks like you don`t have an account,Let`s create a new account for',
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          width: 2.sp,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: TextWidget(
                            size: 10.sp,
                            text: '${controller.displayUserEmail}',
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    AuthTextFiled(
                      controller: nameController,
                      obscureText: false,
                      validator: (value) {},
                      hintText: 'Name',
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    GetBuilder<AuthController>(
                      builder: (_) => AuthTextFiled(
                        controller: passwordController,
                        maxLines: 1,
                        obscureText: controller.isVisibilty ? false : true,
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
                    RichText(
                      text: TextSpan(
                        text:
                            "By selecting Agree and continue below,\nI agree to ",
                        style: TextStyle(color: Colors.black, fontSize: 10.sp),
                        children: const <TextSpan>[
                          TextSpan(
                              text: 'Terms of Service and Privacy policy',
                              style: TextStyle(color: Colors.red)),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    GetBuilder<AuthController>(
                      builder: (_) => AuthButton(
                        text: 'Agree and Continue',
                        onPressed: () {
                          String name = nameController.text;
                          String password = passwordController.text;
                          controller.signUpUsingEmail(
                            name: name,
                            password: password,
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
