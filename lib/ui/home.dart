import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var imagePath;

  void openCamera() async {
    var picture = await ImagePicker.pickImage(
      source: ImageSource.camera,
    );
    setState(() {
      imagePath = picture;
    });
    print("yej $picture");
    final FirebaseVisionImage visionImage =
        FirebaseVisionImage.fromFile(imagePath);
    print('vison $visionImage');
    final TextRecognizer textRecognizer =
        FirebaseVision.instance.textRecognizer();
    final VisionText visionText =
        await textRecognizer.processImage(visionImage);

    String text = visionText.text;
    print("osp $text");
    for (TextBlock block in visionText.blocks) {
      final Rect boundingBox = block.boundingBox;
      final List<Offset> cornerPoints = block.cornerPoints;
      final String text = block.text;
      final List<RecognizedLanguage> languages = block.recognizedLanguages;

      for (TextLine line in block.lines) {
        // Same getters as TextBlock
        for (TextElement element in line.elements) {
          // Same getters as TextBlock
          print('element $element');
        }
      }
    }
  }

  processImage() {}

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
          imagePath != null
              ? Image.file(
                  imagePath,
                  height: 50.0,
                  width: 50.0,
                )
              : Container()
        ],
      ),
    );
  }
}
