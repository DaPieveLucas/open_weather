import 'dart:convert';

import '../../domain/entities/city_weather_entity.dart';
import 'main_data_model.dart';

class CityWeatherDataModel extends CityWeatherEntity {
  factory CityWeatherDataModel.fromJson(String source) =>
      CityWeatherDataModel.fromMap(json.decode(source) as Map<String, dynamic>);

  factory CityWeatherDataModel.fromMap(Map<String, dynamic> map) {
    return CityWeatherDataModel(
      mainDataModel: MainDataModel.fromMap(map['main'] as Map<String, dynamic>),
      name: map['name'] as String,
    );
  }
  CityWeatherDataModel({required super.mainDataModel, required super.name});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'mainDataModel': mainDataModel.toMap(),
      'name': name,
    };
  }

  String toJson() => json.encode(toMap());
}
