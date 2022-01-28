import 'package:flutter/material.dart';

class PlaceDetailsPage extends StatelessWidget {
  static const routeName = '/place-details';
  const PlaceDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Place Details'),
      ),
      body: Center(
        child: Text('Place Details'),
      ),
    );
  }
}
