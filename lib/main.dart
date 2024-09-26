import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(SimpleWeatherApp());
}

class SimpleWeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Simple Weather Info App'),
        ),
        body: WeatherUI(),
      ),
    );
  }
}

class WeatherUI extends StatefulWidget {
  @override
  _WeatherUIState createState() => _WeatherUIState();
}

class _WeatherUIState extends State<WeatherUI> {
  final TextEditingController _cityController = TextEditingController();
  String city = '--';
  String temperature = '--';
  String condition = '--';
  List<String> forecast = [];

  void fetchWeather() {
    setState(() {
      city = _cityController.text;
      temperature = '${Random().nextInt(16) + 15}°C';
      condition = ['Sunny', 'Cloudy', 'Rainy'][Random().nextInt(3)];
    });
  }

  void fetch7DayForecast() {
    setState(() {
      forecast = List.generate(7, (index) {
        final temp = Random().nextInt(16) + 15;
        final cond = ['Sunny', 'Cloudy', 'Rainy'][Random().nextInt(3)];
        return 'Day ${index + 1}: $temp°C, $cond';
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: _cityController,
            decoration: InputDecoration(labelText: 'Enter City Name'),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: fetchWeather,
            child: Text('Fetch Weather'),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: fetch7DayForecast,
            child: Text('Fetch 7-Day Forecast'),
          ),
          SizedBox(height: 20),
          Text('City: $city'),
          Text('Temperature: $temperature'),
          Text('Condition: $condition'),
          SizedBox(height: 20),
          if (forecast.isNotEmpty)
            Column(
              children: forecast.map((f) => Text(f)).toList(),
            ),
        ],
      ),
    );
  }
}
