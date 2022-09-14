import 'package:open_weather/app/features/home_page/domain/entities/city_weather_entity.dart';
import 'package:open_weather/core/errors/failure.dart';
import 'package:open_weather/utils/either.dart';

import '../repositories/city_weather_repository.dart';
import 'city_weather_usecase.dart';

class CityWeatherUsecaseImpl implements CityWeatherUsecase {
  CityWeatherUsecaseImpl({required CityWeatherRepository cityWeatherRepository})
      : _cityWeatherRepository = cityWeatherRepository;
  final CityWeatherRepository _cityWeatherRepository;

  @override
  Future<Either<Failure, CityWeatherEntity>> call(String cityName) async {
    return await _cityWeatherRepository(cityName);
  }
}
