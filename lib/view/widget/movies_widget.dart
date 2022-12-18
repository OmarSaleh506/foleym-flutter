import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../logic/controllers/movies_controller.dart';
import 'auth_widget/text_widget.dart';

class MoviesWidget extends StatefulWidget {
  const MoviesWidget({super.key});
  @override
  State<MoviesWidget> createState() => _GenresWidgetState();
}
class _GenresWidgetState extends State<MoviesWidget> {
  final moviesController = Get.put(MoviesController());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: ((context, index) {
              moviesController.isCardEnabled.add(false);
              return InkWell(
                onTap: () {
                  moviesController.isCardEnabled.replaceRange(
                      0, moviesController.isCardEnabled.length, [
                    for (int i = 0; i < moviesController.isCardEnabled.length; i++)
                      false
                  ]);
                  moviesController.isCardEnabled[index] = true;
                  setState(() {});
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextWidget(
                    size: 10.sp,
                    text: moviesController.genres[index],
                    color: moviesController.isCardEnabled[index]
                        ? Colors.red
                        : Colors.white,
                  ),
                ),
              );
            }),
            itemCount: moviesController.genres.length,
          ),
        ),
      ],
    );
  }
}
