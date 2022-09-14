import 'dart:developer';

import 'package:open_weather/core/errors/failure.dart';
import 'package:open_weather/utils/either.dart';

import '../../core/errors/weather_failure.dart';
import '../../domain/entities/name_entity.dart';
import '../../domain/repositories/city_weather_repository.dart';
import '../datasources/weather_datasource/weather_datasource.dart';

class CityWeatherRepositoryImpl implements CityWeatherRepository {
  CityWeatherRepositoryImpl({required WeatherDatasource weatherDatasource})
      : _weatherDatasource = weatherDatasource;
  final WeatherDatasource _weatherDatasource;

  @override
  Future<Either<Failure, NameEntity>> call(String cityName) async {
    try {
      final result = await _weatherDatasource.call(cityName);

      return Right(result);
    } catch (e, s) {
      log('CityWeatherRepositoryImpl', error: e, stackTrace: s);
      throw Left(
        WeatherFailure(message: 'Failure when getting weather datasource'),
      );
    }
  }
}
