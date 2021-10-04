import 'package:clima/services/weather.dart';
import 'package:clima/utilities/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ForecastScreen extends StatefulWidget {
  ForecastScreen({@required this.weatherData, this.cityName});

  final weatherData;
  final String cityName;

  @override
  _ForecastScreenState createState() => _ForecastScreenState();
}

class _ForecastScreenState extends State<ForecastScreen> {
  @override
  List<int> temp = [5, 10, 10, 10, 10];
  List<String> id = [];
  List<String> message = [];
  WeatherModel weatherModel = WeatherModel();

  void initState() {
    super.initState();
    updateData(widget.weatherData);
  }

  void updateData(var locationData) {
    if (locationData != null) {
      setState(() {
        double tempo = locationData['list'][0]['main']['temp'];
        temp[0] = (tempo.toInt());
        int condition = locationData['list'][0]['weather'][0]['id'];
        id.add(weatherModel.getWeatherIcon(condition));
        message.add(locationData['list'][0]['weather'][0]['description']);

        tempo = locationData['list'][8]['main']['temp'];
        temp[1] = (tempo.toInt());
        condition = locationData['list'][8]['weather'][0]['id'];
        id.add(weatherModel.getWeatherIcon(condition));
        message.add(locationData['list'][8]['weather'][0]['description']);

        tempo = locationData['list'][16]['main']['temp'];
        temp[2] = (tempo.toInt());
        condition = locationData['list'][16]['weather'][0]['id'];
        id.add(weatherModel.getWeatherIcon(condition));
        message.add(locationData['list'][16]['weather'][0]['description']);

        tempo = locationData['list'][24]['main']['temp'];
        temp[3] = (tempo.toInt());
        condition = locationData['list'][24]['weather'][0]['id'];
        id.add(weatherModel.getWeatherIcon(condition));
        message.add(locationData['list'][24]['weather'][0]['description']);

        tempo = locationData['list'][32]['main']['temp'];
        temp[4] = (tempo.toInt());
        condition = locationData['list'][32]['weather'][0]['id'];
        id.add(weatherModel.getWeatherIcon(condition));
        message.add(locationData['list'][32]['weather'][0]['description']);
      });
    } else {
      print('hello world');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.grey.shade800,
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            DayForecast(
              temp: temp[0],
              condition: id[0],
              message: message[0],
              city: widget.cityName,
              date: weatherModel.getDate(1),
            ),
            DayForecast(
              temp: temp[1],
              condition: id[1],
              message: message[1],
              city: widget.cityName,
              date: weatherModel.getDate(2),
            ),
            DayForecast(
              temp: temp[2],
              condition: id[2],
              message: message[2],
              city: widget.cityName,
              date: weatherModel.getDate(3),
            ),
            DayForecast(
              temp: temp[3],
              condition: id[3],
              message: message[3],
              city: widget.cityName,
              date: weatherModel.getDate(4),
            ),
            DayForecast(
              temp: temp[4],
              condition: id[4],
              message: message[4],
              city: widget.cityName,
              date: weatherModel.getDate(5),
            ),
          ],
        ),
      ),
    ));
  }
}

class DayForecast extends StatefulWidget {
  DayForecast({this.temp, this.condition, this.message, this.city, this.date});

  final int temp;
  final String condition;
  final String message;
  final String city;
  final String date;

  @override
  _DayForecastState createState() => _DayForecastState();
}

class _DayForecastState extends State<DayForecast> {
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
                    '${widget.date}',
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
                'Temprature :',
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
                    widget.condition,
                    style: kTempTextStyle,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 100,
            ),
            Container(
              child: Text(
                '${widget.message} in ${widget.city}',
                textAlign: TextAlign.center,
                style: kMessageTextStyle,
              ),
            ),
            SizedBox(
              height: 170,
            ),
            Container(
              margin: EdgeInsets.all(20),
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
