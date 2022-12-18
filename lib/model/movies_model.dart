import 'package:foleym/model/genres_model.dart';

class MovieList {
  int? page;
  int? totalMovies;
  int? totalPages;
  List<Movie>? movies;

  MovieList({this.page, this.totalMovies, this.totalPages, this.movies});

  MovieList.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    totalMovies = json['total_results'];
    totalPages = json['total_pages'];
    if (json['results'] != null) {
      movies = [];
      json['results'].forEach((v) {
        movies!.add(new Movie.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    data['total_results'] = this.totalMovies;
    data['total_pages'] = this.totalPages;
    if (this.movies != null) {
      data['results'] = this.movies!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Movie {
  int? voteCount;
  int? id;
  bool? video;
  String? voteAverage;
  String? title;
  double? popularity;
  String? posterPath;
  String? originalLanguage;
  String? originalTitle;
  List<int>? genreIds;
  String? backdropPath;
  bool? adult;
  String? overview;
  String? releaseDate;

  Movie({
    this.voteCount,
    this.id,
    this.video,
    this.voteAverage,
    this.title,
    this.popularity,
    this.posterPath,
    this.originalLanguage,
    this.originalTitle,
    this.genreIds,
    this.backdropPath,
    this.adult,
    this.overview,
    this.releaseDate,
  });

  Movie.fromJson(Map<String, dynamic> json) {
    voteCount = json['vote_count'];
    id = json['id'];
    video = json['video'];
    voteAverage = json['vote_average'].toString();
    title = json['title'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    genreIds = json['genre_ids'].cast<int>();
    backdropPath = json['backdrop_path'];
    adult = json['adult'];
    overview = json['overview'];
    releaseDate = json['release_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['vote_count'] = this.voteCount;
    data['id'] = this.id;
    data['video'] = this.video;
    data['vote_average'] = this.voteAverage;
    data['title'] = this.title;
    data['popularity'] = this.popularity;
    data['poster_path'] = this.posterPath;
    data['original_language'] = this.originalLanguage;
    data['original_title'] = this.originalTitle;
    data['genre_ids'] = this.genreIds;
    data['backdrop_path'] = this.backdropPath;
    data['adult'] = this.adult;
    data['overview'] = this.overview;
    data['release_date'] = this.releaseDate;
    return data;
  }
}

// To parse this JSON data, do
//
//     final movies = moviesFromJson(jsonString);

// import 'dart:convert';
// class MovieList {
//   int? page;
//   int? totalMovies;
//   int? totalPages;
//   List<Movie>? movies;

//   MovieList({this.page, this.totalMovies, this.totalPages, this.movies});

//   MovieList.fromJson(Map<String, dynamic> json) {
//     page = json['page'];
//     totalMovies = json['total_results'];
//     totalPages = json['total_pages'];
//     if (json['results'] != null) {
//       movies = [];
//       json['results'].forEach((v) {
//         movies!.add(new Movie.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['page'] = this.page;
//     data['total_results'] = this.totalMovies;
//     data['total_pages'] = this.totalPages;
//     if (this.movies != null) {
//       data['results'] = this.movies!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// MovieList moviesFromJson(String str) => MovieList.fromJson(json.decode(str));

// String moviesToJson(MovieList data) => json.encode(data.toJson());

// class Movie {
//     Movie({
//         this.adult,
//         this.backdropPath,
//         this.belongsToCollection,
//         this.budget,
//         this.genres,
//         this.homepage,
//         this.id,
//         this.imdbId,
//         this.originalLanguage,
//         this.originalTitle,
//         this.overview,
//         this.popularity,
//         this.posterPath,
//         this.productionCompanies,
//         this.productionCountries,
//         this.releaseDate,
//         this.revenue,
//         this.runtime,
//         this.spokenLanguages,
//         this.status,
//         this.tagline,
//         this.title,
//         this.video,
//         this.voteAverage,
//         this.voteCount,
//     });

//     bool? adult;
//     String? backdropPath;
//     dynamic belongsToCollection;
//     int? budget;
//     List<Genre>? genres;
//     String? homepage;
//     int? id;
//     String? imdbId;
//     String? originalLanguage;
//     String? originalTitle;
//     String? overview;
//     double? popularity;
//     dynamic posterPath;
//     List<ProductionCompany>? productionCompanies;
//     List<ProductionCountry>? productionCountries;
//     DateTime? releaseDate;
//     int? revenue;
//     int? runtime;
//     List<SpokenLanguage>? spokenLanguages;
//     String? status;
//     String? tagline;
//     String? title;
//     bool? video;
//     double? voteAverage;
//     int? voteCount;

//     factory Movie.fromJson(Map<String, dynamic> json) => Movie(
//         adult: json["adult"],
//         backdropPath: json["backdrop_path"],
//         belongsToCollection: json["belongs_to_collection"],
//         budget: json["budget"],
//         genres: List<Genre>.from(json["genres"].map((x) => Genre.fromJson(x))),
//         homepage: json["homepage"],
//         id: json["id"],
//         imdbId: json["imdb_id"],
//         originalLanguage: json["original_language"],
//         originalTitle: json["original_title"],
//         overview: json["overview"],
//         popularity: json["popularity"].toDouble(),
//         posterPath: json["poster_path"],
//         productionCompanies: List<ProductionCompany>.from(json["production_companies"].map((x) => ProductionCompany.fromJson(x))),
//         productionCountries: List<ProductionCountry>.from(json["production_countries"].map((x) => ProductionCountry.fromJson(x))),
//         releaseDate: DateTime.parse(json["release_date"]),
//         revenue: json["revenue"],
//         runtime: json["runtime"],
//         spokenLanguages: List<SpokenLanguage>.from(json["spoken_languages"].map((x) => SpokenLanguage.fromJson(x))),
//         status: json["status"],
//         tagline: json["tagline"],
//         title: json["title"],
//         video: json["video"],
//         voteAverage: json["vote_average"].toDouble(),
//         voteCount: json["vote_count"],
//     );

//     Map<String, dynamic> toJson() => {
//         "adult": adult,
//         "backdrop_path": backdropPath,
//         "belongs_to_collection": belongsToCollection,
//         "budget": budget,
//         "genres": List<dynamic>.from(genres!.map((x) => x.toJson())),
//         "homepage": homepage,
//         "id": id,
//         "imdb_id": imdbId,
//         "original_language": originalLanguage,
//         "original_title": originalTitle,
//         "overview": overview,
//         "popularity": popularity,
//         "poster_path": posterPath,
//         "production_companies": List<dynamic>.from(productionCompanies!.map((x) => x.toJson())),
//         "production_countries": List<dynamic>.from(productionCountries!.map((x) => x.toJson())),
//         "release_date": "${releaseDate!.year.toString().padLeft(4, '0')}-${releaseDate!.month.toString().padLeft(2, '0')}-${releaseDate!.day.toString().padLeft(2, '0')}",
//         "revenue": revenue,
//         "runtime": runtime,
//         "spoken_languages": List<dynamic>.from(spokenLanguages!.map((x) => x.toJson())),
//         "status": status,
//         "tagline": tagline,
//         "title": title,
//         "video": video,
//         "vote_average": voteAverage,
//         "vote_count": voteCount,
//     };
// }

// class Genre {
//     Genre({
//         required this.id,
//         required this.name,
//     });

//     int id;
//     String name;

//     factory Genre.fromJson(Map<String, dynamic> json) => Genre(
//         id: json["id"],
//         name: json["name"],
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//     };
// }

// class ProductionCompany {
//     ProductionCompany({
//         required this.id,
//         required this.logoPath,
//         required this.name,
//         required this.originCountry,
//     });

//     int id;
//     String logoPath;
//     String name;
//     String originCountry;

//     factory ProductionCompany.fromJson(Map<String, dynamic> json) => ProductionCompany(
//         id: json["id"],
//         logoPath: json["logo_path"] == null ? null : json["logo_path"],
//         name: json["name"],
//         originCountry: json["origin_country"],
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "logo_path": logoPath == null ? null : logoPath,
//         "name": name,
//         "origin_country": originCountry,
//     };
// }

// class ProductionCountry {
//     ProductionCountry({
//         required this.iso31661,
//         required this.name,
//     });

//     String iso31661;
//     String name;

//     factory ProductionCountry.fromJson(Map<String, dynamic> json) => ProductionCountry(
//         iso31661: json["iso_3166_1"],
//         name: json["name"],
//     );

//     Map<String, dynamic> toJson() => {
//         "iso_3166_1": iso31661,
//         "name": name,
//     };
// }

// class SpokenLanguage {
//     SpokenLanguage({
//         required this.iso6391,
//         required this.name,
//     });

//     String iso6391;
//     String name;

//     factory SpokenLanguage.fromJson(Map<String, dynamic> json) => SpokenLanguage(
//         iso6391: json["iso_639_1"],
//         name: json["name"],
//     );

//     Map<String, dynamic> toJson() => {
//         "iso_639_1": iso6391,
//         "name": name,
//     };
// }
