import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:foleym/view/widget/text_widget.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../logic/controllers/movies_controller.dart';
import '../../model/movies_model.dart';
import '../../utils/url_constants.dart';
import 'movie_details.dart';

class Movies extends StatefulWidget {
  Movies({super.key, required this.api});
  final String api;

  @override
  State<Movies> createState() => _CarouselSliderImageState();
}

class _CarouselSliderImageState extends State<Movies> {
  List<Movie>? moviesList;

  @override
  void initState() {
    super.initState();
    controller.fetchMovies(widget.api).then((value) {
      setState(() {
        moviesList = value.cast<Movie>();
      });
    });
  }

  final controller = Get.put(MoviesController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MoviesController>(
      builder: (_) => SizedBox(
        width: 80.w,
        height: 38.h,
        child: moviesList == null
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : CarouselSlider.builder(
                carouselController: controller.carouselController,
                itemCount: moviesList!.length,
                itemBuilder: (context, int itemIndex, int pageViewIndex) {
                  return GestureDetector(
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(3.w),
                            topRight: Radius.circular(3.w),
                          ),
                          child: Hero(
                            tag: '${moviesList![itemIndex].id}',
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(3.w),
                                topRight: Radius.circular(3.w),
                              ),
                              child: FadeInImage(
                                image: NetworkImage(TMDB_BASE_IMAGE_URL +
                                    'w500/' +
                                    moviesList![itemIndex].posterPath!),
                                fit: BoxFit.cover,
                                placeholder: const AssetImage(
                                    'assets/images/loading.gif'),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 33.3.h,
                          child: Container(
                            height: 4.h,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.4),
                            ),
                            width: 51.w,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 3.w,
                                ),
                                Expanded(
                                  child: TextWidget(
                                    size: 12.sp,
                                    text: "${moviesList![itemIndex].title}",
                                    color: Colors.black.withOpacity(0.8),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                SizedBox(
                                  width: 2.w,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 4.w),
                                  child: Row(
                                    children: [
                                      TextWidget(
                                        size: 10.sp,
                                        text:
                                            '${moviesList![itemIndex].voteAverage}',
                                        color: Colors.black,
                                      ),
                                      SizedBox(
                                        width: 0.5.w,
                                      ),
                                      const Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MovieDetails(
                            movie: moviesList![itemIndex],
                            heroId: '${moviesList![itemIndex].id}',
                          ),
                        ),
                      );
                      print(moviesList![itemIndex].title);
                      print(moviesList![itemIndex].id);
                    },
                  );
                },
                options: CarouselOptions(
                  enlargeCenterPage: true,
                  disableCenter: true,
                  viewportFraction: 0.6,
                  onPageChanged: (index, reason) {
                    controller.current = index;
                  },
                ),
              ),
      ),
    );
  }
}
