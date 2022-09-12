import '../../models/city_weather_data_model.dart';

abstract class WeatherDatasource {
  Future<CityWeatherDataModel> call();
}
