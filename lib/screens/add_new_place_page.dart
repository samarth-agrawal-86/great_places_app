import 'package:flutter/material.dart';
import 'package:great_places_app/widgets/image_input.dart';

class AddNewPlacePage extends StatelessWidget {
  static const routeName = '/add-place';
  AddNewPlacePage({Key? key}) : super(key: key);
  final _titleController = TextEditingController();
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
                  ImageInput(),
                ],
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.save),
              label: Text('Submit'),
              style: TextButton.styleFrom(
                  elevation: 0,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  primary: Theme.of(context).primaryColor,
                  backgroundColor: Theme.of(context).accentColor),
            ),
          ],
        ));
  }
}
