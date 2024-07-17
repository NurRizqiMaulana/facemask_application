import 'package:flutter/material.dart';

import '../../constants.dart';

class PosterPage extends StatefulWidget {
  const PosterPage({Key? key}) : super(key: key);

  @override
  State<PosterPage> createState() => _PosterPageState();
}

class _PosterPageState extends State<PosterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Poster Page"),
          backgroundColor: Constants.primaryColor),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Image.asset(
          'assets/images/poster.jpg', // Make sure to add your image in the assets folder
          fit: BoxFit.fill, // This ensures the image covers the whole screen
        ),
      ),
    );
  }
}
