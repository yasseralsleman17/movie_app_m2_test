part of 'movie_details_bloc.dart';

abstract class MovieDetailsEvent extends Equatable {
  const MovieDetailsEvent();
}

class GetMovieDetailsEvent extends MovieDetailsEvent {
  String movieName = "";
  GetMovieDetailsEvent(this.movieName);
  @override
   List<Object?> get props => [movieName];

}
