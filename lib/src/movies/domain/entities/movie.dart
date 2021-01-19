import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  const Movie({
    this.title,
    this.urlImage,
  });

  final String title;
  final String urlImage;

  @override
  List<Object> get props => [title, urlImage];
}
