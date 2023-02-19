import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_imdb_project/movie_form.dart';
import 'movie_movie_entity.dart';

class MovieJsonService {


  Future<List<Movie>> getMoviesBy(SingingCharacter sortBy) async {
    String filter = sortByTranslator(sortBy);
    final response = await http.get(
      Uri.parse('https://imdb-top-100-movies.p.rapidapi.com/'),
      headers: {
        'X-RapidAPI-Key': '3f02d2d692msh42980a866e9b7edp18ad87jsn8188afe85341',
        'X-RapidAPI-Host': 'imdb-top-100-movies.p.rapidapi.com',
      },
    );
    if (response.statusCode == 200) {

      final jsonString = response.body;
      final dynamic json = jsonDecode(jsonString);

      // Convert the JSON array to a List
      final List<dynamic> movieList = List.from(json);

      // Create a list of Movie objects
      final List<Movie> movies = [];
      for (final movie in movieList) {
        final List<String> genreListFromJson = addToGenreList(movie);
        if(genreListFromJson.contains(filter)){
        final String titleFromJson = movie['title'];
        final String imageFromJson = movie['image'];
        final String thumbnailFromJson = movie['thumbnail'];
        final String descrFromJson = movie['description'];
        final String trailerFromJson = movie['trailer'];
        final String uniqueIdFromJson = movie['imdbid'];

        final Movie newMovie = Movie(
                title: titleFromJson,
                thumbnail: thumbnailFromJson,
                genreList: genreListFromJson,
                image: imageFromJson,
                description: descrFromJson,
                trailer: trailerFromJson,
                id: uniqueIdFromJson
              );

        movies.add(newMovie);
        }
      }
      return movies;
    } else {
      throw Exception('Failed to load movies');
    }
  }

  List<String> addToGenreList(movie) {
    List<String> result = [];
    final List<dynamic> genreList = List.from(movie['genre']);

    for(final genre in genreList){
      result.add(genre.toString());
    }
    return result;
  }

  String sortByTranslator(SingingCharacter sortBy) {
    String result = "";
    switch (sortBy) {
      case SingingCharacter.happy:
        result = "Comedy";
        break;

      case SingingCharacter.sad:
        result = "Drama";
        break;

      case SingingCharacter.romance:
        result = "Romance";
        break;

      default:
        result = "Action";
    }
    return result;
  }
}
