import 'package:flutter/material.dart';
import 'package:foleym/logic/bindings/movies_bindings.dart';
import 'package:foleym/routes/route.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: AppRoutes.homeScreen,
          getPages: AppRoutes.routes,
          initialBinding: MoviesBinding(),
        );
      },
    );
  }
}
