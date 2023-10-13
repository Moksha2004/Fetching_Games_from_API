import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';
class Cam extends StatefulWidget {
  const Cam({Key? key}) : super(key: key);

  @override
  State<Cam> createState() => _CamState();
}

class _CamState extends State<Cam> {
   late File _image;
  //File _image = Image.network('https://example.com/image.jpg') as File;
  final imagePicker=ImagePicker();
  // Future getImage() async{
  //   final image=await imagePicker.getImage(source:ImageSource.camera);
  //   setState(() {
  //     _image=File(image!.path);
  //   });
  // }
  Future<void> getImage() async {
    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      _image = File(pickedFile.path);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _image==null?Text("No image Selected"): Image.file(_image),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        child: Icon(Icons.camera_alt),
        onPressed: getImage,
      ),
    );
  }
}
