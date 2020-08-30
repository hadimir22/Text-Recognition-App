import 'package:flutter/material.dart';

class ShowText extends StatelessWidget {
  final String extractedText;

  ShowText({Key key, @required this.extractedText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Extracted Text'),
        centerTitle: true,
        backgroundColor: Color(0XFF00BFA6),
      ),
      backgroundColor: Colors.white,
    );
  }
}
