import 'package:foleym/view/screens/favorites_screen.dart';
import 'package:foleym/view/screens/profile_screen.dart';
import 'package:get/get.dart';

import '../../view/screens/home_screen.dart';

class NavigationBarController extends GetxController {
  RxInt currentIndex = 0.obs;
  final tabs = [
    HomeScreen(),
    ProfileScreen(),
    FavoritesScreen(),
  ].obs;
  final title = [
    "home",
    'profile',
    'favorites',
  ].obs;
}
