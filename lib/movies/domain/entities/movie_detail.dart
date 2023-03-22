import 'package:equatable/equatable.dart';

import 'rating.dart';

class MovieDetail extends Equatable {
  final String poster;
  final String genres;
  final List<Rating> rating;
  final String id;
  final String plot;
  final String release;
  final String runtime;
  final String title;
  final String imdbRating;

  const MovieDetail({
    required this.poster,
    required this.genres,
    required this.rating,
    required this.id,
    required this.plot,
    required this.release,
    required this.runtime,
    required this.title,
    required this.imdbRating,
  });

  @override
  List<Object> get props => [
        poster,
        genres,
        rating,
        id,
        plot,
        release,
        runtime,
        title,
        imdbRating,
      ];
}
