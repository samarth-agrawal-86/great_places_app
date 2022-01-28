import 'dart:io';
import 'package:flutter/material.dart';

class PlaceLocation {
  final double lat;
  final double long;
  final String? address;

  PlaceLocation({
    required this.lat,
    required this.long,
    this.address,
  });
}

class Place {
  final String id;
  final String title;
  final File image;
  final PlaceLocation location;

  Place({
    required this.id,
    required this.title,
    required this.image,
    required this.location,
  });
}
