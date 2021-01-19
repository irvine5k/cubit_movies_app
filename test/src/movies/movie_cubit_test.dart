import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_app/src/movies/domain/repositories/get_movies_repository.dart';
import 'package:movie_app/src/movies/domain/usecases/get_movies.dart';
import 'package:movie_app/src/movies/infra/models/movie_model.dart';
import 'package:movie_app/src/movies/presenter/logic/movie_cubit.dart';
import 'package:movie_app/src/movies/presenter/logic/movie_state.dart';

class MockGetMoviesRepository extends Mock implements GetMoviesRepository {}

void main() {
  test('Emits movies when repository answer correctly', () async {
    final mockGetMoviesRepository = MockGetMoviesRepository();

    final movies = [
      MovieModel(title: 'title 01', urlImage: 'url 01'),
      MovieModel(title: 'title 02', urlImage: 'url 02'),
    ];

    when(mockGetMoviesRepository.getMovies()).thenAnswer(
      (_) async => movies,
    );

    final moviesCubit = MoviesCubit(GetMoviesImpl(mockGetMoviesRepository));

    await expectLater(
      moviesCubit,
      emitsInOrder([
        LoadedState(movies),
      ]),
    );
  });
}
