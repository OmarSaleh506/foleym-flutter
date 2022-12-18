import 'package:foleym/logic/bindings/auth_binding.dart';
import 'package:foleym/logic/bindings/movies_bindings.dart';
import 'package:foleym/view/screens/hi_screen.dart';
import 'package:foleym/view/screens/home_screen.dart';
import 'package:foleym/view/screens/login_screen.dart';
import 'package:foleym/view/screens/profile_screen.dart';
import 'package:foleym/view/screens/signup_screen.dart';
import 'package:foleym/view/widget/bottom_navigation_bar.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const hiScreen = Routes.hiScreen;
  static const signUpScreen = Routes.signUpScreen;
  static const loginScreen = Routes.loginScreen;
  static const bar = Routes.bar;

  static final routes = [
    GetPage(
      name: Routes.homeScreen,
      page: () => HomeScreen(),
      binding: MoviesBinding(),
    ),
    GetPage(
      name: Routes.hiScreen,
      page: () => HiScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.signUpScreen,
      page: () => SignUp(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.loginScreen,
      page: () => LoginScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.profileScreen,
      page: () => ProfileScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.bar,
      page: () => BottomNavigationBarWidget(),
      bindings: [
        AuthBinding(),
      ],
    ),
  ];
}

class Routes {
  static const homeScreen = '/homeScreen';
  static const bar = '/bar';
  static const hiScreen = '/hiScreen';
  static const signUpScreen = '/signUpScreen';
  static const loginScreen = '/loginScreen';
  static const profileScreen = '/profileScreen';
}
