import '../../../domain/entities/name_entity.dart';

abstract class WeatherDatasource {
  Future<NameEntity> call(String cityName);
}
