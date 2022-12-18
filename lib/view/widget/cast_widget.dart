import 'package:flutter/material.dart';
import 'package:foleym/view/widget/auth_widget/text_widget.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../logic/controllers/movies_controller.dart';
import '../../model/credits_model.dart';
import '../../utils/url_constants.dart';

class CastWidget extends StatefulWidget {
  final String api;
  const CastWidget({super.key, required this.api});

  @override
  State<CastWidget> createState() => _CastWidgetState();
}

class _CastWidgetState extends State<CastWidget> {
  final controller = Get.put(MoviesController());

  Credits? credits;
  @override
  void initState() {
    super.initState();
    controller.fetchCredits(widget.api).then((value) {
      setState(() {
        credits = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 120,
      child: credits == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: credits!.cast!.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {},
                    child: SizedBox(
                      width: 80,
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            child: SizedBox(
                              width: 15.w,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: credits!.cast![index].profilePath == null
                                    ? Image.asset(
                                        'assets/images/cast.gif',
                                        fit: BoxFit.cover,
                                      )
                                    : FadeInImage(
                                        image: NetworkImage(
                                            TMDB_BASE_IMAGE_URL +
                                                'w500/' +
                                                credits!
                                                    .cast![index].profilePath!),
                                        fit: BoxFit.cover,
                                        placeholder: AssetImage(
                                            'assets/images/loading.gif'),
                                      ),
                              ),
                            ),
                          ),
                          TextWidget(
                            text: credits!.cast![index].name!,
                            size: 12.sp,
                            overflow: TextOverflow.ellipsis,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
