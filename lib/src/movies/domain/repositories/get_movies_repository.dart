import 'package:movie_app/src/movies/domain/entities/movie.dart';

abstract class GetMoviesRepository {
  Future<List<Movie>> getMovies();
}
