import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_app/src/movies/movie_cubit.dart';
import 'package:movie_app/src/movies/movie_model.dart';
import 'package:movie_app/src/movies/movie_repository.dart';
import 'package:movie_app/src/movies/movie_state.dart';

class MockRepository extends Mock implements MovieRepository {}

void main() {
  MockRepository movieRepository;
  MoviesCubit moviesCubit;

  final movies = [
    MovieModel(title: 'title 01', urlImage: 'url 01'),
    MovieModel(title: 'title 02', urlImage: 'url 02'),
  ];

  setUp(() {
    movieRepository = MockRepository();
    when(movieRepository.getMovies()).thenAnswer(
      (_) async => movies,
    );

    moviesCubit = MoviesCubit(repository: movieRepository);
  });

  test('Emits movies when repository answer correctly', () async {
    await expectLater(
      moviesCubit,
      emits(
        LoadedState(movies),
      ),
    );
  });
}
