import 'package:flutter/material.dart';
import 'package:lit_starfield/view/lit_starfield_container.dart';
import 'package:movie_imdb_project/main.dart';
import 'movie_listScreen.dart';
import 'movie_jsonService.dart';
import 'movie_movie_entity.dart';
import 'movie_trailer.dart';

class MovieDetail extends StatelessWidget{
  final Movie movie;

  const MovieDetail({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title,style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.035)),
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
        number: 50,
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
      Center(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                child: SizedBox(),
              ),
            ),
            Expanded(
              flex: 8,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.white,
                      width: 10
                  )
                ),
                child: Hero(
                    tag: movie.title,
                    child: Image.network(movie.image)),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                child: SizedBox(),
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Text("Description: ${movie.description}",style: TextStyle(fontStyle: FontStyle.italic),textAlign: TextAlign.center),
                ),
              ),
            )
          ],
        ),
      ),
        ],
      ),
    );
  }
}

