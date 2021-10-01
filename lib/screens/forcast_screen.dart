import 'package:clima/utilities/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ForecastScreen extends StatefulWidget {
  ForecastScreen({this.weatherData});

  var weatherData;

  @override
  _ForecastScreenState createState() => _ForecastScreenState();
}

class _ForecastScreenState extends State<ForecastScreen> {
  @override
  int temp;

  void initState() {
    super.initState();
    updateData(widget.weatherData);
  }

  void updateData(var locationData) {
    setState(() {
      double tempo = locationData['list'][0]['main']['temp'];
      temp = tempo.toInt();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            DayForcast(temp),
            DayForcast(temp),
            DayForcast(temp),
            DayForcast(temp),
            DayForcast(temp),
          ],
        ),
      ),
    ));
  }
}

class DayForcast extends StatefulWidget {
  DayForcast(this.temp);

  int temp;

  @override
  _DayForcastState createState() => _DayForcastState();
}

class _DayForcastState extends State<DayForcast> {
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Text(
                    '${widget.temp}°',
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
            SizedBox(
              height: 130,
            ),
            Container(
              child: Text(
                'Message in City',
                textAlign: TextAlign.center,
                style: kMessageTextStyle,
              ),
            ),
            SizedBox(
              height: 200,
            ),
            Container(
              child: Center(
                child: Text(
                  'Have a nice day 😊',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Spartan MB',
                      fontSize: 40,
                      color: Colors.grey.shade900),
                ),
              ),
            )
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
