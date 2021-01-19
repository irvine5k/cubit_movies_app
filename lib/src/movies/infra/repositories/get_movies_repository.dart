import 'package:movie_app/src/movies/domain/entities/movie.dart';
import 'package:movie_app/src/movies/domain/repositories/get_movies_repository.dart';
import 'package:movie_app/src/movies/infra/datasources/get_movies_datasource.dart';

class GetMoviesRepositoryImpl extends GetMoviesRepository {
  final GetMoviesDatasource getMoviesDatasource;

  GetMoviesRepositoryImpl(this.getMoviesDatasource);

  @override
  Future<List<Movie>> getMovies() async {
    try {
      final movies = await getMoviesDatasource.getMovies();
      return movies;
    } catch (e) {
      return [];
    }
  }
}
