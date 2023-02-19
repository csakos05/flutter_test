import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lit_starfield/lit_starfield.dart';
import 'package:movie_imdb_project/movie_listScreen.dart';

enum SingingCharacter { sad, happy, romance, action }

class MovieForm extends StatefulWidget {
  const MovieForm({super.key});

  @override
  State<MovieForm> createState() => _MovieFormState();
}

class _MovieFormState extends State<MovieForm> {
   double iconSizeHappy = 24;
   double iconSizeSad = 24;
   double iconSizeRomance = 24;
   double textSizeHappy = 24;
   double textSizeRomance = 24;
   double textSizeSad = 24;
   SingingCharacter? _character = SingingCharacter.action;

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
                        iconSizeHappy = 70.0;
                        textSizeHappy = 32;
                      });
                    },
                    onExit: (PointerEvent event) {
                      setState(() {
                        iconSizeHappy = 40.0;
                        textSizeHappy = 16;
                      });
                    },
                    child: ListTile(
                      title: Text('Vidám', style: TextStyle(fontSize: textSizeHappy)),
                      leading: _character == SingingCharacter.happy
                          ? Icon(Icons.mood,color: Colors.white,size: iconSizeHappy)
                          : Icon(Icons.mood,color: Colors.black,size: iconSizeHappy),
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
                        iconSizeRomance = 70.0;
                        textSizeRomance = 32;
                      });
                    },
                    onExit: (PointerEvent event) {
                      setState(() {
                        iconSizeRomance = 40.0;
                        textSizeRomance = 16;
                      });
                    },
                    child: ListTile(
                      title: Text('Romantikus', style: TextStyle(fontSize: textSizeRomance)),
                      leading: _character == SingingCharacter.romance
                          ? Icon(Icons.favorite,color: Colors.white,size: iconSizeRomance)
                          : Icon(Icons.favorite,color: Colors.black,size: iconSizeRomance),
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
                        iconSizeSad = 70.0;
                        textSizeSad = 32;
                      });
                    },
                    onExit: (PointerEvent event) {
                      setState(() {
                        iconSizeSad = 40.0;
                        textSizeSad = 16;
                      });
                    },
                    child: ListTile(
                      title: Text('Szomorú', style: TextStyle(fontSize: textSizeSad)),
                      leading: _character == SingingCharacter.sad
                          ? Icon(Icons.mood_bad,color: Colors.white,size: iconSizeSad)
                          : Icon(Icons.mood_bad,color: Colors.black,size: iconSizeSad),
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
