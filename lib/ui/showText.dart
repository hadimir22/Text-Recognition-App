import 'package:flutter/material.dart';
import 'package:clipboard_manager/clipboard_manager.dart';
import 'package:google_fonts/google_fonts.dart';

class ShowText extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final String extractedText;

  ShowText({Key key, @required this.extractedText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          'Extracted Text',
          style: screenName(),
        ),
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
                  style: extractedTextStyle(),
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
                      onPressed: () {
                        copyToClipboard(extractedText);
                      },
                      color: Color(0XFF06A48F),
                      textColor: Colors.white70,
                      child: Text(
                        "copy to clipboard",
                        style: copyBtn(),
                      ))),
            ),
          )
        ],
      ),
    );
  }

  void copyToClipboard(String extractedText) {
    ClipboardManager.copyToClipBoard(extractedText).then((result) {
      _scaffoldKey.currentState.showSnackBar(new SnackBar(
          content: Text(
        'copied',
        style: snakBar(),
      )));
    });
  }
}

TextStyle screenName() {
  return GoogleFonts.josefinSans(
      textStyle: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold));
}

TextStyle copyBtn() {
  return GoogleFonts.josefinSans(
      textStyle: TextStyle(
          fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white));
}

TextStyle snakBar() {
  return GoogleFonts.josefinSans(
      textStyle: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.normal,
          color: Color(0XFF06A48F)));
}

TextStyle extractedTextStyle() {
  return GoogleFonts.josefinSans(
      textStyle: TextStyle(
    fontSize: 18.0,
  ));
}
