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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            flex: 10,
            child: SingleChildScrollView(
              child: Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  extractedText,
                  style: TextStyle(fontSize: 50.0),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0.2, 0.0, 0.2, 10.0),
              child: ListTile(
                  title: RaisedButton(
                      splashColor: Colors.black26,
                      disabledColor: Colors.grey,
                      elevation: 15.0,
                      onPressed: () {},
                      color: Color(0XFF06A48F),
                      textColor: Colors.white70,
                      child: Text(
                        "copy to clipboard",
                      ))),
            ),
          )
        ],
      ),
    );
  }
}
