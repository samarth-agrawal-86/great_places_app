import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspath;

class ImageInput extends StatefulWidget {
  final Function onSelectImage;
  ImageInput(this.onSelectImage);
  @override
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? _storedImage;

  Future<void> _takePicture() async {
    final picker = ImagePicker();
    final imageFile = await picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 600,
    );

    if (imageFile == null) {
      return;
    }
    setState(() {
      _storedImage = File(imageFile.path);
    });

    //print(imageFile!.path);
    final appDir = await syspath.getApplicationDocumentsDirectory();
    // print(appDir);
    // print(appDir.path);
    final fileName = path.basename(imageFile.path);
    // print(fileName);
    // There is no copy method. so we save the file in our documents
    await imageFile.saveTo('${appDir.path}/$fileName');
    // we can use File() method to open the file at the provided path location
    // path is a string
    var savedImage = File(appDir.path + '/' + fileName);
    //print(savedImage);

    widget.onSelectImage(savedImage);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Center(
          child: Container(
            height: 150,
            width: 150,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                border: Border.all(
              color: Colors.grey,
              width: 1.0,
            )),
            child: _storedImage == null
                ? Text(
                    'Add an Image',
                  )
                : Image.file(
                    _storedImage!,
                    fit: BoxFit.cover,
                  ),
          ),
        ),
        SizedBox(width: 10),
        TextButton.icon(
          onPressed: () {
            _takePicture();
          },
          icon: Icon(Icons.camera),
          label: Text('Take a picture'),
        ),
        SizedBox(width: 10),
      ],
    );
  }
}
