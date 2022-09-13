import 'dart:convert';

class MainDataModel {
  MainDataModel({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
  });
  factory MainDataModel.fromMap(Map<String, dynamic> map) {
    return MainDataModel(
      temp: map['temp'] as double,
      feelsLike: map['feels_like'] as double,
      tempMin: map['temp_min'] as double,
      tempMax: map['temp_max'] as double,
      pressure: map['pressure'] as int,
      humidity: map['humidity'] as int,
    );
  }

  factory MainDataModel.fromJson(String source) =>
      MainDataModel.fromMap(json.decode(source) as Map<String, dynamic>);

  final double temp;
  final double feelsLike;
  final double tempMin;
  final double tempMax;
  final int pressure;
  final int humidity;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'temp': temp,
      'feels_like': feelsLike,
      'temp_min': tempMin,
      'temp_max': tempMax,
      'pressure': pressure,
      'humidity': humidity,
    };
  }

  String toJson() => json.encode(toMap());
}
