import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/src/movies/domain/usecases/get_movies.dart';
import 'package:movie_app/src/movies/presenter/logic/movie_state.dart';

class MoviesCubit extends Cubit<MoviesState> {
  MoviesCubit(this.getMovies) : super(InitialState()) {
    _getTrendingMovies();
  }

  final GetMovies getMovies;

  void _getTrendingMovies() async {
    try {
      emit(LoadingState());
      final movies = await getMovies();
      emit(LoadedState(movies));
    } catch (e) {
      emit(ErrorState());
    }
  }
}
