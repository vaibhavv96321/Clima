import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:clima/utilities/constants.dart';

class WeatherModel {
  Future<dynamic> customCityWeather(var cityName, String urlData) async {
    NetworkHelper networkHelper =
        NetworkHelper('$urlData&q=$cityName&appid=$kApiKey');
    var weatherHelper = await networkHelper.getData();
    return weatherHelper;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
        '$kUrl&lat=${location.latitude}&lon=${location.longitude}&appid=$kApiKey');
    var weatherHelper = await networkHelper.getData();
    return weatherHelper;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ';
    } else if (condition < 700) {
      return 'โ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return '๐';
    } else if (condition <= 804) {
      return 'โ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }

  String getDate(int day) {
    int d, m;
    d = DateTime.now().day;
    m = DateTime.now().month;
    if (day == 1) return d.toString() + '/' + m.toString();
    if (day == 2)
      return (d + 1 > 31 ? 31 - d + 1 : d + 1).toString() +
          '/' +
          (d + 1 > 31 ? m + 1 : m).toString();
    if (day == 3)
      return (d + 2 > 31 ? 31 - d + 2 : d + 2).toString() +
          '/' +
          (d + 2 > 31 ? m + 1 : m).toString();
    if (day == 4)
      return (d + 3 > 31 ? 31 - d + 3 : d + 3).toString() +
          '/' +
          (d + 3 > 31 ? m + 1 : m).toString();
    if (day == 5)
      return (d + 4 > 31 ? 31 - d + 4 : d + 4).toString() +
          '/' +
          (d + 4 > 31 ? m + 1 : m).toString();
  }
}
