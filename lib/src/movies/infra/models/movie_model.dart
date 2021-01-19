import 'package:movie_app/src/movies/domain/entities/movie.dart';

class MovieModel extends Movie {
  const MovieModel({
    this.title,
    this.urlImage,
  });

  final String title;
  final String urlImage;

  factory MovieModel.empty() => MovieModelEmpty();

  static MovieModel fromMap(Map<String, dynamic> map) {
    if (map == null) return MovieModel.empty();

    return MovieModel(
      title: map['title'],
      urlImage: 'https://image.tmdb.org/t/p/w185${map['poster_path']}',
    );
  }

  @override
  String toString() => '''
  Movie : {
    title: $title
    urlImage: $urlImage
  }
  ''';
}

class MovieModelEmpty extends MovieModel {
  const MovieModelEmpty() : super(title: '', urlImage: '');
}
