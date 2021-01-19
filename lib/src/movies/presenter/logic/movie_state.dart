import 'package:equatable/equatable.dart';
import 'package:movie_app/src/movies/infra/models/movie_model.dart';

abstract class MoviesState extends Equatable {}

class InitialState extends MoviesState {
  @override
  List<Object> get props => [];
}

class LoadingState extends MoviesState {
  @override
  List<Object> get props => [];
}

class LoadedState extends MoviesState {
  LoadedState(this.movies);

  final List<MovieModel> movies;

  @override
  List<Object> get props => [movies];

  @override
  String toString() => 'movies : $movies';
}

class ErrorState extends MoviesState {
  @override
  List<Object> get props => [];
}
