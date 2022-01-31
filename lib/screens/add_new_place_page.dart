import 'dart:io';

import 'package:flutter/material.dart';
import 'package:great_places_app/providers/great_places.dart';
import 'package:great_places_app/widgets/image_input.dart';
import 'package:great_places_app/widgets/location_input.dart';
import 'package:provider/provider.dart';

class AddNewPlacePage extends StatelessWidget {
  static const routeName = '/add-place';
  AddNewPlacePage({Key? key}) : super(key: key);
  final _titleController = TextEditingController();
  File? _pickedImage;

  void saveImage(File pickedImage) {
    _pickedImage = pickedImage;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Add new place'),
          automaticallyImplyLeading: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  TextField(
                    controller: _titleController,
                    decoration: InputDecoration(labelText: 'Title'),
                  ),
                  SizedBox(height: 10),
                  ImageInput(saveImage),
                  SizedBox(height: 10),
                  LocationInput()
                ],
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {
                if (_titleController.text.isNotEmpty && _pickedImage != null) {
                  Provider.of<GreatPlaces>(context, listen: false)
                      .saveGreatPlace(_titleController.text, _pickedImage!);
                  Navigator.of(context).pop();
                }
                return;
              },
              icon: Icon(Icons.save),
              label: Text('Submit'),
              style: TextButton.styleFrom(
                  elevation: 0,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  primary: Theme.of(context).primaryColor,
                  minimumSize: Size.fromHeight(60),
                  backgroundColor: Theme.of(context).accentColor),
            ),
          ],
        ));
  }
}
