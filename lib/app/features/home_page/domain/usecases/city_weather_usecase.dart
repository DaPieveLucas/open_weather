import 'package:open_weather/core/errors/failure.dart';
import 'package:open_weather/utils/either.dart';

import '../entities/city_weather_entity.dart';

abstract class CityWeatherUsecase {
  Future<Either<Failure, CityWeatherEntity>> call(String cityName);
}
