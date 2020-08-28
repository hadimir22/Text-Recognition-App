import 'package:flutter/material.dart';
import 'package:textRecognition/ui/home.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Text Extractor',
    initialRoute: 'home',
    routes: {
      'home': (context) => Home(),
//      '/addCities': (context) => AddCities(),
    },
    home: new Home(),
  ));
}
