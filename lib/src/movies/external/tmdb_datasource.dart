import 'package:dio/dio.dart';
import 'package:movie_app/src/movies/infra/datasources/get_movies_datasource.dart';
import 'package:movie_app/src/movies/infra/models/movie_model.dart';

class GetMoviesTMDBDataSource implements GetMoviesDatasource {
  GetMoviesTMDBDataSource(this.client);

  final Dio client;

  @override
  Future<List<MovieModel>> getMovies() async {
    try {
      final url =
          'https://api.themoviedb.org/3/trending/movie/week?api_key=060e7c76aff06a20ca4a875981216f3f';

      final response = await client.get(url);

      final movies = List<MovieModel>.of(
        response.data['results'].map<MovieModel>(
            (json) => MovieModel.fromMap(json as Map<String, dynamic>)),
      );

      return movies;
    } catch (e) {
      return [];
    }
  }
}
