import 'package:flutter/material.dart';

class Movie {
  final String title;
  final String thumbnail;
  final List<String> genreList;
  final String image;
  final String description;
  final String trailer;

  Movie({
    required this.title,
    required this.thumbnail,
    required this.genreList,
    required this.image,
    required this.description,
    required this.trailer,
  });

// factory Movie.fromJson(Map<String, dynamic> json) {
//   return Movie(
//       title: json['title'] as String,
//       thumbnail: json['thumbnail'] as String
//   );
// }
}