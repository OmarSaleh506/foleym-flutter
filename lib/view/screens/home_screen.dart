import 'package:flutter/material.dart';
import 'package:foleym/logic/controllers/movies_controller.dart';
import 'package:foleym/servises/servise.dart';
import 'package:foleym/view/widget/auth_widget/text_widget.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../logic/controllers/auth_controller.dart';
import '../widget/movies.dart';
import '../widget/header_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final controller = Get.put(AuthController());
  final moviesController = Get.put(MoviesController());

  @override
  Widget build(BuildContext context) {
    int currentIndex = 0;
    return SafeArea(
      child: Scaffold(
        // bottomNavigationBar: BottomNavigationBar(
        //   backgroundColor: Colors.white,
        //   currentIndex: currentIndex,
        //   type: BottomNavigationBarType.fixed,
        //   items: [
        //     BottomNavigationBarItem(
        //       activeIcon: Icon(
        //         Icons.home,
        //         color: Colors.red,
        //       ),
        //       icon: Icon(
        //         Icons.home,
        //         color: Colors.black,
        //       ),
        //       label: '',
        //     ),
        //     BottomNavigationBarItem(
        //       activeIcon: Icon(
        //         Icons.favorite,
        //         color: Colors.red,
        //       ),
        //       icon: Icon(
        //         Icons.favorite,
        //         color: Colors.black,
        //       ),
        //       label: '',
        //     ),
        //     BottomNavigationBarItem(
        //       activeIcon: Icon(
        //         Icons.person,
        //         color: Colors.red,
        //       ),
        //       icon: Icon(
        //         Icons.person,
        //         color: Colors.black,
        //       ),
        //       label: '',
        //     ),
        //   ],
        //   onTap: (index) {
        //     currentIndex = index;
        //   },
        // ),
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Header(
                widget: const Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                text: controller.displayUserName.isNotEmpty
                    ? 'Welcome ${controller.displayUserName.value}'
                    : "Welcome",
                onPressed: () {},
              ),
              SizedBox(
                height: 2.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 4.w),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: TextWidget(
                    size: 12.sp,
                    text: "Discover Movies",
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Movies(
                api: Endpoints.discoverMoviesUrl(1),
              ),
              SizedBox(
                height: 3.h,
              ),
              //  MoviesWidget(),
              Padding(
                padding: EdgeInsets.only(left: 4.w),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: TextWidget(
                    size: 12.sp,
                    text: "Top Rated Movies",
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Movies(
                api: Endpoints.topRatedUrl(1),
              ),
              SizedBox(
                height: 3.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 4.w),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: TextWidget(
                    size: 12.sp,
                    text: "UpComing Movies",
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Movies(
                api: Endpoints.upcomingMoviesUrl(1),
              ),
              SizedBox(
                height: 3.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 4.w),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: TextWidget(
                    size: 12.sp,
                    text: "Now Playing Movies",
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Movies(
                api: Endpoints.nowPlayingMoviesUrl(2),
              ),
              SizedBox(
                height: 3.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 4.w),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: TextWidget(
                    size: 12.sp,
                    text: "Popular Movies",
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Movies(
                api: Endpoints.popularMoviesUrl(2),
              ),
              SizedBox(
                height: 2.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
