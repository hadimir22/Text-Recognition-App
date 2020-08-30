import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:textRecognition/ui/showText.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _mainScaffoldKey =
      new GlobalKey<ScaffoldState>();
  var imagePath;

  void openCamera() async {
    var picture = await ImagePicker.pickImage(
      source: ImageSource.camera,
    );
    setState(() {
      imagePath = picture;
    });
    processImage(picture);
  }

  processImage(image) async {
    try {
      final FirebaseVisionImage visionImage =
          FirebaseVisionImage.fromFile(image);
      print('vison $visionImage');
      final TextRecognizer textRecognizer =
          FirebaseVision.instance.textRecognizer();
      final VisionText visionText =
          await textRecognizer.processImage(visionImage);

      String text = visionText.text;
      if (text != null || text.length > 0) {
        navigate(text);
      } else {
        _mainScaffoldKey.currentState.showSnackBar(new SnackBar(
            content: new Text(
          'could not detect text',
          style: snakBar(),
        )));
      }
      print('oslo $text');
    } catch (e) {
      print('error $e');
    }
  }

  navigate(extractedText) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ShowText(extractedText: extractedText)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _mainScaffoldKey,
      appBar: AppBar(
        title: Text(
          'Text Extractor',
          style: screenName(),
        ),
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
          Center(
            child: FlatButton(
              padding: EdgeInsets.all(30.0),
              color: Color(0XFF06A48F),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100.0)),
              child: Icon(
                Icons.photo_camera,
                color: Colors.white,
              ),
              onPressed: () {
                openCamera();
              },
            ),
          ),
        ],
      ),
    );
  }
}

TextStyle screenName() {
  return GoogleFonts.josefinSans(
      textStyle: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold));
}

TextStyle snakBar() {
  return GoogleFonts.josefinSans(
      textStyle: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.normal,
          color: Color(0XFF06A48F)));
}
