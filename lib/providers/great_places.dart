import 'package:flutter/material.dart';
import 'package:great_places_app/models/place.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get getAllItems {
    return [..._items];
  }
}