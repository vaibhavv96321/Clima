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
            Container(
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.lightBlueAccent,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: 1500,
                      child: Center(
                          child: Text(
                        'scroll',
                        style: TextStyle(fontSize: 30),
                      )),
                    ),
                  ],
                ),
              ),
              width: 300,
              height: double.infinity,
            ),
            Container(
                width: 200,
                color: Colors.grey,
                child: Center(
                  child: Text(
                    'hello world',
                    style: TextStyle(fontSize: 30),
                  ),
                ))
          ],
        ),
      ),
    ));
  }
}

//TODO: 1).i have created the scroll view horizontally as well as vertically in each horizontal container i need only design and content layout is completed.ForecastScreen
//TODO: 2).link for the api Data => ( https://api.openweathermap.org/data/2.5/forecast?units=metric&lat=35&lon=139&appid=c3e5dbea8fa0bcf22782386cce656bb4# )
//TODO: 3). I need city name , time ,date ,temprature from the above link .
