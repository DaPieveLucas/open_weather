import '../../../../../core/errors/failure.dart';
import '../../../../../utils/either.dart';
import '../entities/city_weather_entity.dart';

abstract class CityWeatherRepository {
  Future<Either<Failure, CityWeatherEntity>> call(String cityName);
}
