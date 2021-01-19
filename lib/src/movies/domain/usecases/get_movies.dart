import 'package:movie_app/src/movies/domain/entities/movie.dart';
import 'package:movie_app/src/movies/domain/repositories/get_movies_repository.dart';

abstract class GetMovies {
  Future<List<Movie>> call();
}

class GetMoviesImpl implements GetMovies {
  final GetMoviesRepository moviesRepository;

  GetMoviesImpl(this.moviesRepository);

  @override
  Future<List<Movie>> call() async {
    try {
      final movies = await moviesRepository.getMovies();
      return movies;
    } catch (_) {
      return [];
    }
  }
}
