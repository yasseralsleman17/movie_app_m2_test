import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_m2_test/movies/presentation/screens/movie_detail_screen.dart';

import '../../../core/error/exceptions.dart';
import '../../../core/network/api_constance.dart';
import '../../../core/network/error_message_model.dart';
import '../../../core/services/services_locator.dart';
import '../../data/models/movie_details_model.dart';
import '../controller/movie_details_bloc.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen();

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String textFieldValue = "";
  bool showLoadingScreen = false;

  MovieDetailsModel? movieCards;

  Future<void> loadData(String movieName) async {
    final response =
        await Dio().get(ApiConstance.movieDetailsByName(movieName));

    if (response.statusCode == 200) {
      setState(() {
        movieCards = MovieDetailsModel.fromJson(response.data);
      });
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => sl<MovieDetailsBloc>(),
        lazy: false,
        child: Scaffold(
            appBar: AppBar(title: Builder(builder: (context) {
              return ListTile(
                leading: const Icon(Icons.search),
                title: TextField(
                  onChanged: (value) => textFieldValue = value,
                  onEditingComplete: () {
                    if (textFieldValue.isNotEmpty) {
                      FocusManager.instance.primaryFocus?.unfocus();
                      showLoadingScreen = true;

                      loadData(textFieldValue);
                    }
                  },
                  style: const TextStyle(
                    fontSize: 18,
                    color: Color(0xFFBEBEBE),
                    height: 1,
                  ),
                  cursorColor: Colors.white,
                  autofocus: true,
                  autocorrect: false,
                  textInputAction: TextInputAction.search,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                  ),
                ),
              );
            })),
            body: movieCards == null
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              MovieDetailScreen(id: movieCards!.title),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Stack(
                        children: [
                          Container(
                            height: double.infinity,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.black,
                            ),
                            child: Center(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5.2),
                                child: CachedNetworkImage(
                                    height: double.infinity,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                    placeholder: (context, url) => Column(
                                          children: [
                                            Container(
                                              height: 20,
                                            )
                                          ],
                                        ),
                                    imageUrl: movieCards!.poster,
                                    errorWidget: (context, url, error) =>
                                        Column(
                                          children: [
                                            Container(
                                              height: 20,
                                            )
                                          ],
                                        )),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )));
  }
}
