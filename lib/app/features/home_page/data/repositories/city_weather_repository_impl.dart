import 'dart:developer';

import 'package:open_weather/app/features/home_page/domain/entities/city_weather_entity.dart';
import 'package:open_weather/core/errors/failure.dart';
import 'package:open_weather/utils/either.dart';

import '../../core/errors/weather_failure.dart';
import '../../domain/repositories/city_weather_repository.dart';
import '../datasources/weather_datasource/weather_datasource.dart';

class CityWeatherRepositoryImpl implements CityWeatherRepository {
  CityWeatherRepositoryImpl({required WeatherDatasource weatherDatasource})
      : _weatherDatasource = weatherDatasource;
  final WeatherDatasource _weatherDatasource;

  @override
  Future<Either<Failure, CityWeatherEntity>> call() async {
    try {
      final result = await _weatherDatasource.call();

      return Right(result);
    } catch (e, s) {
      log('CityWeatherRepositoryImpl', error: e, stackTrace: s);
      throw Left(
        WeatherFailure(message: 'Failure when getting weather datasource'),
      );
    }
  }
}