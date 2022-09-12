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
      temp: map['main']['temp'] as double,
      feelsLike: map['main']['feelsLike'] as double,
      tempMin: map['main']['tempMin'] as double,
      tempMax: map['main']['tempMax'] as double,
      pressure: map['main']['pressure'] as int,
      humidity: map['main']['humidity'] as int,
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
      'feelsLike': feelsLike,
      'tempMin': tempMin,
      'tempMax': tempMax,
      'pressure': pressure,
      'humidity': humidity,
    };
  }

  String toJson() => json.encode(toMap());
}
