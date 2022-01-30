import 'dart:io';

import 'package:flutter/material.dart';
import 'package:great_places_app/helpers/db_helper.dart';
import 'package:great_places_app/models/place.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get getAllItems {
    return [..._items];
  }

  void saveGreatPlace(String pickedTitle, File pickedImage) {
    var newPlace = Place(
      id: DateTime.now().toString(),
      title: pickedTitle,
      image: pickedImage,
      location: null,
    );
    //_items.add(newPlace);
    notifyListeners();
    var data = {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image.path,
      // we need to pass the path here (Sting) not the File object
    };
    DBHelper.insert('user_places', data);
  }

  Future<void> fetchAndSetPlace() async {
    var places = await DBHelper.getData('user_places');
    List<Place> _results = [];
    for (var place in places) {
      var p = Place(
        id: place['id'],
        title: place['title'],
        image: File(place['image']),
        location: null,
      );
      _results.add(p);
    }
    _items = _results;
    notifyListeners();
  }
}
