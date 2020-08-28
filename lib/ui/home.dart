import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Text Extractor'),
        centerTitle: true,
        backgroundColor: Color(0XFFFF63A1),
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10.0),
            alignment: Alignment.bottomLeft,
            child: Image.asset('images/file_analysis.png',
                width: 200.0, height: 200.0, fit: BoxFit.fill),
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 150.0),
            child: Column(
              children: <Widget>[
                RaisedButton(
                  child: Text('Capture'),
                ),
                Container(
                  child: Text('or'),
                ),
                RaisedButton(
                  child: Text('Gallery'),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
