import 'dart:convert';
import 'dart:developer';
import 'dart:js';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movie_imdb_project/movie_detail.dart';
import 'package:movie_imdb_project/movie_form.dart';
import 'movie_jsonService.dart';
import 'movie_movie_entity.dart';
import 'package:lit_starfield/lit_starfield.dart';


class MovieListScreen extends StatefulWidget {
  final SingingCharacter? sortBy;
  const MovieListScreen({Key? key, this.sortBy}) : super(key: key);

  @override
  _MovieListScreenState createState() => _MovieListScreenState();
}

class SortBy {
  final String radioValue;

  SortBy(this.radioValue);
}

class _MovieListScreenState extends State<MovieListScreen> {
 late List<Movie> _movies = [];



  @override
  void initState() {

    super.initState();
    _fetchMovies(widget.sortBy);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title:  Text('Top Movies for ${widget.sortBy}', style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.035)),
          actions: [
            Container(
              width: 100,
              child: Image.asset(
            'images/imdb.png',
              ),
            ),
            Icon(Icons.more_vert),
      ],
          automaticallyImplyLeading: true,
          bottomOpacity: 0.1,

    ),
      body: Stack(
        children: [

        const LitStarfieldContainer(
        animated: true,
        number: 250,
        velocity: 0.85,
        depth: 0.9,
        scale: 4,
        starColor: Colors.white,
        backgroundDecoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(10, 10, 10, 1.0),
            //  Color.fromRGBO(45, 10, 10, 1.0),
              Color.fromRGBO(24, 0, 38, 1.0)
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
      ),
      ListView.builder(
        itemCount: _movies.length,
        itemBuilder: (context, index) {
          final movie = _movies[index];
          return GestureDetector(
              onTap: (){

              },
              child: _MovieListItem(movie: movie));

        },
      )
      ]
      )
    );
  }

 Future<void> _fetchMovies(SingingCharacter? sortBy) async {
   try {
     final List<Movie> movies = await MovieJsonService().getNewMovies(sortBy!);
     setState(() {
       _movies = movies;
     });
   } catch (e) {
     print(e.toString());
   }
 }
}

class _MovieListItem extends StatefulWidget {
  final Movie movie;

  const _MovieListItem({Key? key, required this.movie}) : super(key: key);

  @override
  __MovieListItemState createState() => __MovieListItemState();
}

class __MovieListItemState extends State<_MovieListItem> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (_) => MovieDetail(movie: widget.movie)));
      },
      child: MouseRegion(
        onEnter: (_) => setState(() => isHovered = true),
        onExit: (_) => setState(() => isHovered = false),
        child: Container(
          decoration: BoxDecoration(
            color: Color.fromRGBO(225, 225, 225, 0.3),
            borderRadius: BorderRadius.circular(4),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.7),
                offset: Offset(2, 2),
                blurRadius: 10,
              ),
            ],
            border: Border.all(
              color: isHovered ? Colors.white : Colors.transparent,
              width: 2,
            ),
          ),
          clipBehavior: Clip.antiAlias,
          height: 70,
          child: Row(
            children: [
              Hero(
                  tag: widget.movie.title,
                  child: Image.network(widget.movie.thumbnail, width: 70, height: 100,)),
              // SizedBox(width: 5),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    widget.movie.title,
                    style: const TextStyle(fontSize: 14),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}


