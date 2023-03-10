import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_imdb_project/movie_form.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          textTheme: GoogleFonts.antonioTextTheme(Typography.blackMountainView).apply(
              decorationColor: Colors.white,
              bodyColor: Colors.white
          ),
          appBarTheme: AppBarTheme(
              backgroundColor: Color.fromRGBO(5, 3, 3, 0.8),
              iconTheme: IconThemeData(color: Colors.white),
              titleTextStyle:
                              GoogleFonts.anton(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2.5,
                              ),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(10),
                ),
              ),
              shadowColor: Colors.white,
              centerTitle: true,
              toolbarHeight: 85,
          ),
          scaffoldBackgroundColor: const Color.fromRGBO(19, 16, 16, 1.0),
      ),
      home: const MovieForm(),
    );
  }
}


