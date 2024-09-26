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

class WeatherUI extends StatelessWidget {
  final TextEditingController _cityController = TextEditingController();

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
            onPressed: () {},
            child: Text('Fetch Weather'),
          ),
          SizedBox(height: 20),
          Text('City: --'),
          Text('Temperature: --'),
          Text('Condition: --'),
        ],
      ),
    );
  }
}
