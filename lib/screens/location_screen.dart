import 'package:clima/screens/forcast_screen.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import 'city_screen.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({this.weatherData});

  final weatherData;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  int temprature;
  int condition;
  String cityName;
  String weatherMessage;
  String iconMessage;
  WeatherModel weatherModel = WeatherModel();
  var weather;

  @override
  void initState() {
    super.initState();

    updateData(widget.weatherData);
    forcastWeatherFunction();
  }

  void updateData(var locationData) {
    setState(() {
      double temp = locationData['main']['temp'];
      temprature = temp.toInt();
      condition = locationData['weather'][0]['id'];
      iconMessage = weatherModel.getWeatherIcon(condition);
      cityName = locationData['name'];
      weatherMessage = weatherModel.getMessage(temprature);
    });
  }

  void forcastWeatherFunction() async {
    weather = await weatherModel.getLocationWeather(kUrl2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          // this is the property to make decoration behind the container
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  RawMaterialButton(
                    onPressed: () async {
                      var weatherData =
                          await weatherModel.getLocationWeather(kUrl);
                      updateData(weatherData);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  RawMaterialButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return ForecastScreen(weatherData: weather);
                      }));
                    },
                    child: Icon(
                      Icons.five_k,
                      size: 50,
                    ),
                  ),
                  RawMaterialButton(
                    onPressed: () async {
                      var typedName = await Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return CityScreen();
                      }));
                      if (typedName != null) {
                        var weatherData =
                            await weatherModel.customCityWeather(typedName);
                        updateData(weatherData);
                      }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temprature°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      iconMessage,
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  '$weatherMessage in $cityName',
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
