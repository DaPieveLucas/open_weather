import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:open_weather/app/features/home_page/data/datasources/weather_datasource/weather_datasource.dart';

import '../../models/city_weather_data_model.dart';

class WeatherDatasourceImpl implements WeatherDatasource {
  WeatherDatasourceImpl({required Dio restClient}) : _restClient = restClient;
  final Dio _restClient;

  @override
  Future<CityWeatherDataModel> call() async {
    final response = await _restClient.get(
      'http://api.openweathermap.org/data/2.5/weather?q=London&APPID=2cc04d48ec5cd5960b6e48246a7646ff',
    );
    log('${response.data}');

    return CityWeatherDataModel.fromMap(
      response.data,
    );
  }
}
