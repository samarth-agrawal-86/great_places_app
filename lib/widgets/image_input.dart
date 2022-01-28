import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageInput extends StatefulWidget {
  ImageInput({Key? key}) : super(key: key);

  @override
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? _storedImage;

  _takePicture() {
    final picker = ImagePicker();
    picker.pickImage(source: ImageSource.gallery);
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
            decoration: BoxDecoration(
                border: Border.all(
              color: Colors.grey,
              width: 1.0,
            )),
            child: _storedImage == null
                ? Center(
                    child: Text(
                      'Add an Image',
                    ),
                  )
                : Image.file(
                    _storedImage!,
                    fit: BoxFit.cover,
                  ),
          ),
        ),
        SizedBox(width: 10),
        TextButton.icon(
          onPressed: () {},
          icon: Icon(Icons.camera),
          label: Text('Take a picture'),
        ),
        SizedBox(
          width: 10,
        )
      ],
    );
  }
}
