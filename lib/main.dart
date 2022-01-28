import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './providers/great_places.dart';
import './screens/add_new_place_page.dart';
import './screens/place_details_page.dart';
import './screens/places_list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => GreatPlaces()),
      ],
      child: MaterialApp(
        title: 'My Great Places',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          accentColor: Colors.amber,
        ),
        home: PlacesListPage(),
        routes: {
          AddNewPlacePage.routeName: (ctx) => AddNewPlacePage(),
          PlaceDetailsPage.routeName: (ctx) => PlaceDetailsPage()
        },
      ),
    );
  }
}
