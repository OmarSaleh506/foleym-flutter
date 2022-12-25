import 'package:flutter/material.dart';
import 'package:foleym/model/video_model.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../logic/controllers/movies_controller.dart';

class VideoWidget extends StatefulWidget {
  final int movieId;
  const VideoWidget({super.key, required this.movieId});

  @override
  State<VideoWidget> createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  final controller = Get.put(MoviesController());
  late YoutubePlayerController? videoController;

  Video? videos;
  String key = '';
  @override
  void initState() {
    super.initState();
    controller.fetchVideos(widget.movieId).then((value) {
      setState(() {
        videos = value;
      });
      key = videos!.results![0].key!;
      print(key);
    });

    videoController = YoutubePlayerController(
      initialVideoId: key,
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: true,
      ),
    );
    print(videoController);
    videoController = YoutubePlayerController(
      initialVideoId: 'wA6iB3OZDus',
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: true,
      ),
    );
  }

  @override
  void dispose() {
    videoController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: YoutubePlayer(
          controller: videoController!.initialVideoId.isEmpty
              ? YoutubePlayerController(
                  initialVideoId: key,
                  flags: YoutubePlayerFlags(
                    autoPlay: true,
                    mute: true,
                  ),
                )
              : YoutubePlayerController(
                  initialVideoId: 'wA6iB3OZDus',
                  flags: YoutubePlayerFlags(
                    autoPlay: true,
                    mute: true,
                  ),
                ),
          aspectRatio: 16 / 10,
          showVideoProgressIndicator: true,
          progressIndicatorColor: Colors.amber,
          progressColors: const ProgressBarColors(
            playedColor: Colors.amber,
            handleColor: Colors.amberAccent,
          ),
        ),
      ),
    );
  }
}
