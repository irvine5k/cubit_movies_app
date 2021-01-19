import '../models/movie_model.dart';

abstract class GetMoviesDatasource {
  Future<List<MovieModel>> getMovies();
}
