import 'package:open_weather/core/errors/failure.dart';
import 'package:open_weather/utils/either.dart';

import '../entities/name_entity.dart';

abstract class CityWeatherUsecase {
  Future<Either<Failure, NameEntity>> call(String cityName);
}
