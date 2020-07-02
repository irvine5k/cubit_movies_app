import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cubit/flutter_cubit.dart';
import 'package:movie_app/src/movies/movie_cubit.dart';
import 'package:movie_app/src/movies/movie_page.dart';
import 'package:movie_app/src/movies/movie_repository.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: CubitProvider<MoviesCubit>(
        create: (context) => MoviesCubit(
          repository: MovieRepository(
            Dio(),
          ),
        ),
        child: MoviesPage(),
      ),
    );
  }
}
