// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:great_places_app/providers/great_places.dart';
import 'package:great_places_app/screens/add_new_place_page.dart';
import 'package:provider/provider.dart';

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
      body: FutureBuilder(
          future: Provider.of<GreatPlaces>(context, listen: false)
              .fetchAndSetPlace(),
          builder: (ctx, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return Consumer<GreatPlaces>(
              child: Center(child: Text('You have not added any image yet')),
              builder: (context, greatPlacesData, ch) {
                return greatPlacesData.getAllItems.length <= 0
                    ? ch!
                    : ListView.builder(
                        itemCount: greatPlacesData.getAllItems.length,
                        itemBuilder: (ctx, i) {
                          final placeData = greatPlacesData.getAllItems[i];
                          return Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: ListTile(
                                  leading: CircleAvatar(
                                    radius: 30,
                                    backgroundImage: FileImage(placeData.image),
                                  ),
                                  title: Text(placeData.title),
                                  onTap: () {
                                    // TODO
                                  },
                                ),
                              ),
                              Divider(),
                            ],
                          );
                        },
                      );
              },
              //child: Text('List of Places'),
            );
          }),
    );
  }
}
