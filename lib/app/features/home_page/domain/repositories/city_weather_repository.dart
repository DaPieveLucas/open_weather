import '../../../../../core/errors/failure.dart';
import '../../../../../utils/either.dart';

import '../entities/name_entity.dart';

abstract class CityWeatherRepository {
  Future<Either<Failure, NameEntity>> call(String cityName);
}
