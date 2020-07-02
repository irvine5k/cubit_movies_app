import 'package:cubit/cubit.dart';
import 'package:movie_app/src/movies/movie_repository.dart';
import 'package:movie_app/src/movies/movie_state.dart';

class MoviesCubit extends Cubit<MoviesState> {
  MoviesCubit({this.repository}) : super(InitialState()) {
    _getTrendingMovies();
  }

  final MovieRepository repository;

  void _getTrendingMovies() async {
    try {
      emit(LoadingState());
      final movies = await repository.getMovies();
      emit(LoadedState(movies));
    } catch (e) {
      emit(ErrorState());
    }
  }
}
