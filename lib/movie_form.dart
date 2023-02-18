import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lit_starfield/lit_starfield.dart';
import 'package:movie_imdb_project/movie_listScreen.dart';

enum SingingCharacter { sad, happy, romance }

class MovieForm extends StatefulWidget {
  const MovieForm({super.key});

  @override
  State<MovieForm> createState() => _MovieFormState();
}

class _MovieFormState extends State<MovieForm> {
  double iconSize = 40;
  SingingCharacter? _character = SingingCharacter.happy;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Üdvözöllek az appban",style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.035)),
        leading: const Icon(Icons.movie,size: 40),
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
        number: 500,
        velocity: 0.85,
        depth: 0.9,
        scale: 4,
        starColor: Colors.white,
        backgroundDecoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(10, 10, 10, 1.0),
              Color.fromRGBO(45, 10, 10, 1.0),
              Color.fromRGBO(29, 6, 44, 1.0)
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
      ),
          Align(
            alignment: Alignment.center,
            child: Container(
              height: 500,
              width: 500,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const Text("Milyen kedved van?",textScaleFactor: 4,textAlign: TextAlign.center),
                  const SizedBox(height: 15),
                  MouseRegion(
                    onHover: (PointerEvent event) {
                      setState(() {
                        iconSize = 50.0; // increase icon size when hovering
                      });
                    },
                    onExit: (PointerEvent event) {
                      setState(() {
                        iconSize = 40.0; // reset icon size when not hovering
                      });
                    },
                    child: ListTile(
                      title: const Text('Vidám'),
                      leading: _character == SingingCharacter.happy
                          ? Icon(Icons.mood,color: Colors.white,size: iconSize)
                          : Icon(Icons.mood,color: Colors.black,size: iconSize),
                      onTap: () {
                        setState(() {
                          _character = SingingCharacter.happy;
                        });
                      },
                    ),
                  ),

                  MouseRegion(
                    onHover: (PointerEvent event) {
                      setState(() {
                        iconSize = 50.0; // increase icon size when hovering
                      });
                    },
                    onExit: (PointerEvent event) {
                      setState(() {
                        iconSize = 40.0; // reset icon size when not hovering
                      });
                    },
                    child: ListTile(
                      title: const Text('Romantikus'),
                      leading: _character == SingingCharacter.romance
                          ? Icon(Icons.favorite,color: Colors.white,size: iconSize)
                          : Icon(Icons.favorite,color: Colors.black,size: iconSize),
                      onTap: () {
                        setState(() {
                          _character = SingingCharacter.romance;
                        });
                      },
                    ),
                  ),

                  MouseRegion(
                    onHover: (PointerEvent event) {
                      setState(() {
                        iconSize = 50.0; // increase icon size when hovering
                      });
                    },
                    onExit: (PointerEvent event) {
                      setState(() {
                        iconSize = 40.0; // reset icon size when not hovering
                      });
                    },
                    child: ListTile(
                      title: const Text('Szomorú'),
                      leading: _character == SingingCharacter.sad
                          ? Icon(Icons.mood_bad,color: Colors.white,size: iconSize)
                          : Icon(Icons.mood_bad,color: Colors.black,size: iconSize),
                      onTap: () {
                        setState(() {
                          _character = SingingCharacter.sad;
                        });
                      },
                    ),
                  ),

                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => MovieListScreen(sortBy: _character,)));
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.orange,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      padding: const EdgeInsets.all(12),
                    ),
                    child: Text('MUTASd',style: GoogleFonts.anton(color: Colors.black,fontSize: 24)),

                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
