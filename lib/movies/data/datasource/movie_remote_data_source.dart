import 'package:dio/dio.dart';

import '../../../core/error/exceptions.dart';
import '../../../core/network/api_constance.dart';
import '../../../core/network/error_message_model.dart';
 import '../models/movie_details_model.dart';

abstract class BaseMovieRemoteDataSource {
  Future<MovieDetailsModel> searchMovie(String movieName);
}

class MovieRemoteDataSource extends BaseMovieRemoteDataSource {
  @override
  Future<MovieDetailsModel> searchMovie(String movieName) async {
     final response =
        await Dio().get(ApiConstance.movieDetailsByName(movieName));

    if (response.statusCode == 200) {
       return MovieDetailsModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
