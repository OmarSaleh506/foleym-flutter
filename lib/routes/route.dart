import 'package:foleym/logic/bindings/movies_bindings.dart';
import 'package:foleym/viwe/screens/home_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const homeScreen = Routes.homeScreen;

  static final routes = [
    GetPage(
      name: Routes.homeScreen,
      page: () => HomeScreen(),
      binding: MoviesBinding(),
    ),
  ];
}

class Routes {
  static const homeScreen = '/homeScreen';
}
