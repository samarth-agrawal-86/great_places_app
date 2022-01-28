import 'package:flutter/material.dart';
import 'package:great_places_app/screens/add_new_place_page.dart';

class PlacesListPage extends StatelessWidget {
  const PlacesListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List of places'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AddNewPlacePage.routeName);
            },
            icon: Icon(Icons.add_a_photo),
          ),
        ],
      ),
      body: Center(
        child: Text('List of Places'),
      ),
    );
  }
}
