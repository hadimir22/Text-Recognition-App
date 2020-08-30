import 'package:flutter/material.dart';
import 'package:textRecognition/ui/home.dart';
import 'package:textRecognition/ui/showText.dart';

void main() async {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Text Extractor',
    initialRoute: 'home',
    routes: {
      'home': (context) => Home(),
    },
    home: new Home(),
  ));
}
