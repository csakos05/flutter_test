import 'package:flutter/material.dart';

class MovieTrailerScreen extends StatelessWidget {
  final String videoId;

  const MovieTrailerScreen({Key? key, required this.videoId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Youtube Player')),
      body: Placeholder()

      // WebView(
      //   initialUrl: videoId,
      //   javascriptMode: JavascriptMode.unrestricted,
      // ),
    );
  }
}
