import '../../domain/entities/movie_detail.dart';
import 'rating_model.dart';

class MovieDetailsModel extends MovieDetail {
  const MovieDetailsModel({
    required super.poster,
    required super.genres,
    required super.rating,
    required super.id,
    required super.plot,
    required super.release,
    required super.runtime,
    required super.title,
    required super.imdbRating,
  });

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) =>
      MovieDetailsModel(
        poster: json["Poster"],
        genres: json["Genre"],
        rating: List<RatingModel>.from(
            json["Ratings"].map((x) => RatingModel.fromJson(x))),
        id: json["imdbID"],
        plot: json["Plot"],
        release: json["Released"],
        runtime: json["Runtime"],
        title: json["Title"],
        imdbRating: json["imdbRating"],
      );
}
