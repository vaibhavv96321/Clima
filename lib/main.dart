import 'package:clima/screens/forcast_screen.dart';
import 'package:flutter/material.dart';
import 'package:clima/screens/loading_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(), //https://pub.dev/packages/location
      home:
          ForecastScreen(), // this is where i got info about the package Location https://pub.dev/packages/location
    );
  }
}
