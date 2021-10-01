import 'package:flutter/material.dart';

const kApiKey = 'c3e5dbea8fa0bcf22782386cce656bb4#';

const kUrl = 'https://api.openweathermap.org/data/2.5/weather?units=metric';

const kUrl2 = 'https://api.openweathermap.org/data/2.5/forecast?units=metric';

const kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 90.0,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 60.0,
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Spartan MB',
);

const kConditionTextStyle = TextStyle(
  fontSize: 100.0,
);

const kTextFieldData = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  icon: Icon(
    Icons.location_city,
    color: Colors.white,
    size: 40,
  ),
  hintText: 'Enter City Name',
  hintStyle: TextStyle(color: Colors.grey, fontSize: 20),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(20),
    ),
  ),
);
