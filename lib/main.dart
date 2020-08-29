import 'package:flutter/material.dart';
import 'package:textRecognition/ui/home.dart';

void main() async {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Text Extractor',
    initialRoute: 'home',
    routes: {
      'home': (context) => Home(),
//      '/capture': (context) => TakePictureScreen(
//            camera: firstCamera,
//          ),
    },
    home: new Home(),
  ));
}
