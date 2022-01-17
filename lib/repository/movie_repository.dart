import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:daily_flutter/model/Movie.dart';

class MovieRepository {
  late var _dio = Dio();
  MovieRepository() {
    _dio = Dio(
      BaseOptions(
        baseUrl: "https://api.themoviedb.org",
        queryParameters: {
          'api_key' : '5dfa55df16f062388ce8791394bd3198',
        },
      ),
    );
  }

  Future<List<Map<String, dynamic>>> loadGenre() async {
    var response = await _dio.get('/3/genre/movie/list');
    if (response.data != null) {
      var data = response.data['genres'] as List;
      return data.map((genre) => genre as Map<String, dynamic>).toList();
    } else {
      return [];
    }
  }

  Future<List<Movie>> loadMovieListWithGenre(int activieGeneId) async {
    var response = await _dio.get('/3/discover/movie',
    queryParameters: {'with_genres' : activieGeneId});
    if (response.data != null && response.data['result'] != null) {
      var data = response.data['results'] as List;
      return data.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      return [];
    }
  }


}