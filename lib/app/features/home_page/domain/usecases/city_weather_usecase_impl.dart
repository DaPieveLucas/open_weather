import 'package:open_weather/core/errors/failure.dart';
import 'package:open_weather/utils/either.dart';

import '../entities/name_entity.dart';
import '../repositories/city_weather_repository.dart';
import 'city_weather_usecase.dart';

class CityWeatherUsecaseImpl implements CityWeatherUsecase {
  CityWeatherUsecaseImpl({required CityWeatherRepository cityWeatherRepository})
      : _cityWeatherRepository = cityWeatherRepository;
  final CityWeatherRepository _cityWeatherRepository;

  @override
  Future<Either<Failure, NameEntity>> call(String cityName) async {
    return await _cityWeatherRepository(cityName);
  }
}
