import 'package:carousel_slider/carousel_controller.dart';
import 'package:foleym/model/video_model.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../model/credits_model.dart';
import '../../model/genres_model.dart';
import '../../model/movies_model.dart';
import '../../servises/servise.dart';

class MoviesController extends GetxController {
  int current = 0;
  final CarouselController carouselController = CarouselController();
  
  List<bool> isCardEnabled = [];
  List<String> image = [
    'assets/images/background.jpg',
    'assets/images/background.jpg',
    'assets/images/background.jpg',
  ];
  List<String> genres = [
    'Acting',
    'Adventure',
    'Animation',
    "Comedy",
    "Crime",
    "Documentary"
  ];
  List<MovieList>? moviesList;

  @override
  void onInit() {
    
    super.onInit();
  }

  Future<List<Object>> fetchMovies(String api) async {
    MovieList movieList;
    var res = await http.get(Uri.parse(api));
    var decodeRes = jsonDecode(res.body);
    movieList = MovieList.fromJson(decodeRes);
    return movieList.movies ?? [];
  }

  Future<Credits> fetchCredits(String api) async {
    Credits credits;
    var res = await http.get(Uri.parse(api));
    var decodeRes = jsonDecode(res.body);
    credits = Credits.fromJson(decodeRes);
    return credits;
  }

  Future<GenresList> fetchGenres() async {
    GenresList genresList;
    var res = await http.get(Uri.parse(Endpoints.genresUrl()));
    var decodeRes = jsonDecode(res.body);
    genresList = GenresList.fromJson(decodeRes);
    return genresList;
  }
  Future<Video> fetchVideos(int movieId) async {
    Video videosList;
    var res = await http.get(Uri.parse(Endpoints.getMoviesForVideo(movieId)));
    var decodeRes = jsonDecode(res.body);
    videosList = Video.fromJson(decodeRes);
    return videosList;
  }
}
