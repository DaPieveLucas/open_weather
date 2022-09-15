import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

import 'weather_data_card_widget.dart';

class GridViewWidget extends StatelessWidget {
  const GridViewWidget({
    required this.temperature,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
    Key? key,
  }) : super(key: key);

  final String temperature;
  final String feelsLike;
  final String tempMin;
  final String tempMax;
  final String pressure;
  final String humidity;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.count(
        crossAxisCount: 2,
        children: [
          WeatherDataCard(
            title: 'Temperature',
            content: temperature,
            iconData: WeatherIcons.celsius,
          ),
          WeatherDataCard(
            title: 'Feels Like',
            content: feelsLike,
            iconData: WeatherIcons.day_sunny_overcast,
          ),
          WeatherDataCard(
            title: 'Min Temperature',
            content: tempMin,
            iconData: WeatherIcons.thermometer_internal,
          ),
          WeatherDataCard(
            title: 'Max Temperature',
            content: tempMax,
            iconData: WeatherIcons.thermometer,
          ),
          WeatherDataCard(
            title: 'Pressure',
            content: pressure,
            iconData: WeatherIcons.barometer,
          ),
          WeatherDataCard(
            title: 'Humidity',
            content: humidity,
            iconData: WeatherIcons.humidity,
          ),
        ],
      ),
    );
  }
}
