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
        backgroundColor: Color(0XFF00BFA6),
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10.0),
            alignment: Alignment.topRight,
            child: Image.asset('images/sync_files.png',
                width: 150.0, height: 150.0, fit: BoxFit.fill),
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            alignment: Alignment.bottomLeft,
            child: Image.asset('images/file_analysis.png',
                width: 200.0, height: 200.0, fit: BoxFit.fill),
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 250.0),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: RaisedButton(
                    child: Text('Capture'),
                    onPressed: () {},
                    textColor: Colors.white,
                    color: Color(0XFF06A48F),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    child: Text('or'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: RaisedButton(
                    child: Text('Gallery'),
                    onPressed: () {},
                    textColor: Colors.white,
                    color: Color(0XFF06A48F),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
