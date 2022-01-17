import 'package:flutter/cupertino.dart';
import 'package:daily_flutter/model/Movie.dart';
import 'package:daily_flutter/repository/movie_repository.dart';

class MovieController extends ChangeNotifier {
  final _movieRepository = MovieRepository();
  var movies = <Movie>[];
  var activeGenreId = -1;

  Future<List<Map<String, dynamic>>> loadGenre() async {
    var genreList = await _movieRepository.loadGenre();
    if (genreList.isNotEmpty) {
      activeGenreId = genreList.first['id'];
      _loadMovieListWithGenre();
    }
    return genreList;
  }

  void changeCategory(Map<String, dynamic> genre) {
    activeGenreId = genre["id"];
    notifyListeners();
    _loadMovieListWithGenre();
  }

  void _loadMovieListWithGenre() async {
    movies = await _movieRepository.loadMovieListWithGenre(activeGenreId);
    notifyListeners();
  }
}
