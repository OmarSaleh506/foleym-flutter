import 'package:flutter/material.dart';
import 'package:foleym/view/widget/auth_widget/text_widget.dart';
import 'package:foleym/view/widget/cast_widget.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../model/genres_model.dart';
import '../../model/movies_model.dart';
import '../../servises/servise.dart';
import '../../utils/url_constants.dart';

class MovieDetails extends StatelessWidget {
  final Movie movie;
  final String heroId;
  const MovieDetails({
    super.key,
    required this.movie,
    required this.heroId,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.withOpacity(0.3),
        body: Stack(
          children: <Widget>[
            movie.backdropPath == null
                ? Image.asset(
                    'assets/images/background.jpg',
                    width: double.infinity,
                    height: Get.height / 2,
                  )
                : FadeInImage(
                    width: double.infinity,
                    height: Get.height / 2,
                    image: NetworkImage(TMDB_BASE_IMAGE_URL +
                        'original/' +
                        movie.backdropPath!),
                    fit: BoxFit.cover,
                    placeholder: AssetImage('assets/images/loading.gif'),
                  ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 2.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Icon(
                          Icons.favorite_border,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 9.h,
                ),
                TextButton(
                  onPressed: () {},
                  child: Icon(
                    Icons.play_circle,
                    color: Color.fromARGB(255, 179, 39, 26),
                    size: 9.h,
                  ),
                ),
                SizedBox(
                  height: 12.h,
                ),
                TextWidget(
                  size: 12.sp,
                  text: movie.title!,
                  color: Colors.white,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 1.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 43.w),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      TextWidget(
                        size: 12.sp,
                        text: movie.voteAverage!,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.calendar_month,
                      color: Colors.white.withOpacity(0.7),
                    ),
                    SizedBox(
                      width: 1.h,
                    ),
                    TextWidget(
                      size: 12.sp,
                      text: movie.releaseDate!,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 1.h,
                    ),
                    Container(
                      height: 3.h,
                      width: 0.3.w,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 1.h,
                    ),
                    Icon(
                      Icons.language,
                      color: Colors.white.withOpacity(0.7),
                    ),
                    SizedBox(
                      width: 1.h,
                    ),
                    TextWidget(
                      size: 12.sp,
                      text: movie.originalLanguage!,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 1.h,
                    ),
                    Container(
                      height: 3.h,
                      width: 0.3.w,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 1.h,
                    ),
                    Icon(
                      Icons.timeline,
                      color: Colors.white.withOpacity(0.7),
                    ),
                    SizedBox(
                      width: 1.h,
                    ),
                    TextWidget(
                      size: 12.sp,
                      text: "${movie.popularity}",
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 1.h,
                    ),
                  ],
                ),
                SizedBox(
                  height: 3.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 4.w),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: TextWidget(
                      size: 14.sp,
                      text: 'OverView',
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Expanded(
                  child: ListView(children: [
                    Padding(
                      padding: EdgeInsets.only(left: 2.w, right: 4.w),
                      child: TextWidget(
                        size: 10.sp,
                        text: "${movie.overview}",
                        color: Colors.grey,
                      ),
                    ),
                  ]),
                ),
                SizedBox(
                  height: 3.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 4.w),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: TextWidget(
                      size: 14.sp,
                      text: 'The Cast',
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                CastWidget(
                  api: Endpoints.getCreditsUrl(movie.id!),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
