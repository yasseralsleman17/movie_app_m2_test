import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../entities/movie_detail.dart';

abstract class BaseMoviesRepository {

  Future<Either<Failure, MovieDetail>> searchMovie(
      String name);

}
