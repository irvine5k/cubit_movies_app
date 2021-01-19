import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/src/movies/domain/usecases/get_movies.dart';
import 'package:movie_app/src/movies/external/tmdb_datasource.dart';
import 'package:movie_app/src/movies/infra/repositories/get_movies_repository.dart';
import 'package:movie_app/src/movies/presenter/logic/movie_cubit.dart';
import 'package:movie_app/src/movies/presenter/ui/movie_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cubit Movies Clean Arch',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BlocProvider<MoviesCubit>(
        create: (context) => MoviesCubit(
          GetMoviesImpl(
            GetMoviesRepositoryImpl(
              GetMoviesTMDBDataSource(
                Dio(),
              ),
            ),
          ),
        ),
        child: MoviesPage(),
      ),
    );
  }
}
