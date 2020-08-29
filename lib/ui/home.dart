import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<void> _optionsDialogBox() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: new SingleChildScrollView(
              child: new ListBody(
                children: <Widget>[
                  GestureDetector(
                    child: new Text('Take a picture'),
                    onTap: openCamera,
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                  ),
                  GestureDetector(
                    child: new Text('Select from gallery'),
                    onTap: openGallery,
                  ),
                ],
              ),
            ),
          );
        });
  }

  void openCamera() async {
    var picture = await ImagePicker.pickImage(
      source: ImageSource.camera,
    );
    print("yej $picture");
  }

  void openGallery() async {
    var gallery = await ImagePicker.pickImage(
      source: ImageSource.gallery,
    );
  }

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
          )
        ],
      ),
    );
  }
}
