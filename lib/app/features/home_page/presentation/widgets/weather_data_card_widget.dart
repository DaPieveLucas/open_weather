import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

class WeatherDataCard extends StatelessWidget {
  const WeatherDataCard({
    required this.title,
    required this.content,
    required this.iconData,
    super.key,
  });

  final String content;
  final String title;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(20),
      elevation: 10,
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.cyan),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
            BoxedIcon(iconData),
            Text(
              content,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }
}
