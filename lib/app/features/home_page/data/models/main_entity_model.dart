import 'dart:convert';

import 'package:open_weather/app/features/home_page/domain/entities/main_entity.dart';

class MainEntityModel extends MainEntity {
  factory MainEntityModel.fromJson(String source) =>
      MainEntityModel.fromMap(json.decode(source));

  factory MainEntityModel.fromEntity({required MainEntity mainEntity}) {
    return MainEntityModel(
      temp: mainEntity.temp,
      feelsLike: mainEntity.feelsLike,
      tempMin: mainEntity.tempMin,
      tempMax: mainEntity.tempMax,
      pressure: mainEntity.pressure,
      humidity: mainEntity.humidity,
    );
  }

  factory MainEntityModel.fromMap(Map<String, dynamic> map) {
    return MainEntityModel(
      temp: map['temp']?.toDouble() ?? 0.0,
      feelsLike: map['feels_like']?.toDouble() ?? 0.0,
      tempMin: map['temp_min']?.toDouble() ?? 0.0,
      tempMax: map['temp_max']?.toDouble() ?? 0.0,
      pressure: map['pressure']?.toInt() ?? 0,
      humidity: map['humidity']?.toInt() ?? 0,
    );
  }
  MainEntityModel({
    required super.temp,
    required super.feelsLike,
    required super.tempMin,
    required super.tempMax,
    required super.pressure,
    required super.humidity,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'temp': temp});
    result.addAll({'feels_like': feelsLike});
    result.addAll({'temp_min': tempMin});
    result.addAll({'temp_max': tempMax});
    result.addAll({'pressure': pressure});
    result.addAll({'humidity': humidity});

    return result;
  }

  String toJson() => json.encode(toMap());
}
