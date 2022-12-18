import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../logic/controllers/auth_controller.dart';
import '../widget/auth_widget/auth_button.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  final controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GetBuilder<AuthController>(
          builder: (_) => AuthButton(
            text: "LogOut",
            onPressed: () {
              controller.signOut();
            },
            color: Colors.black,
            buttonColor: Colors.red,
          ),
        ),
      ),
    );
  }
}
