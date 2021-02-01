import 'package:flutter/material.dart';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weatherPredictorApp/services/weather.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  // double longitude;
  // double latitude;

  @override
  void initState() {
    getLocationData();
    super.initState();
  }

  void getLocationData() async {
    WeatherModel weatherStuff = WeatherModel();
    var weatherData = await weatherStuff.getLocationWeatherData();
    print("Hello there");
    print(weatherData);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return LocationScreen(
            locationWeather: weatherData,
          );
        },
      ),
    );
    // double temperature = decodedData['main']['temp'];
    // int condition = decodedData['weather'][0]['description'];
    // String cityName = decodedData['name'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
