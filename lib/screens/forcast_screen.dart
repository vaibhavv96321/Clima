import 'package:clima/utilities/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ForecastScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            DayForcast(),
            DayForcast(),
            DayForcast(),
            DayForcast(),
            DayForcast(),
          ],
        ),
      ),
    ));
  }
}

class DayForcast extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.grey.withOpacity(0.8),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                height: 100,
                child: Center(
                  child: Text(
                    '01/10',
                    style: TextStyle(
                        fontSize: 40,
                        fontFamily: 'Spartan MB',
                        color: Colors.black),
                  ),
                )),
            SizedBox(
              height: 70,
            ),
            Container(
              child: Text(
                'Temprature',
                style: kButtonTextStyle,
              ),
            ),
            Row(
              children: [
                Container(
                  child: Text(
                    '32°',
                    style: kTempTextStyle,
                  ),
                ),
                Container(
                  child: Text(
                    '☀',
                    style: kTempTextStyle,
                  ),
                ),
              ],
            ),
            Container(
                height: 500,
                child: Text(
                  'hello world',
                  style: kMessageTextStyle,
                )),
          ],
        ),
      ),
      width: 300,
      height: double.infinity,
    );
  }
}

//TODO: 1).i have created the scroll view horizontally as well as vertically in each horizontal container i need only design and content layout is completed.ForecastScreen
//TODO: 2).link for the api Data => ( https://api.openweathermap.org/data/2.5/forecast?units=metric&lat=35&lon=139&appid=c3e5dbea8fa0bcf22782386cce656bb4# )
//TODO: 3). I need city name , time ,date ,temprature from the above link .
