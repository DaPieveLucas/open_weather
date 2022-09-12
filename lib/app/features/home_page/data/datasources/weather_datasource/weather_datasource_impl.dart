import 'package:dio/dio.dart';
import 'package:open_weather/app/features/home_page/data/datasources/weather_datasource/weather_datasource.dart';

import '../../models/city_weather_data_model.dart';

class WeatherDatasourceImpl implements WeatherDatasource {
  final Dio _restClient = Dio();

  @override
  Future<CityWeatherDataModel> call() async {
    final response = await _restClient.get(
      'api.openweathermap.org/data/2.5/weather?q=London&APPID=2cc04d48ec5cd5960b6e48246a7646ff',
    );

    return CityWeatherDataModel.fromJson(
      response.data,
    );
  }
}
