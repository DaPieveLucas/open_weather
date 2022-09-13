import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../data/datasources/weather_datasource/weather_datasource.dart';
import '../../data/datasources/weather_datasource/weather_datasource_impl.dart';
import '../../data/repositories/city_weather_repository_impl.dart';
import '../../domain/repositories/city_weather_repository.dart';
import '../../domain/usecases/city_weather_usecase.dart';
import '../../domain/usecases/city_weather_usecase_impl.dart';
import '../../presentation/cubit/city_weather_cubit.dart';

class CityWeatherInject {
  cityWeatherInject(GetIt getIt) {
    getIt.registerFactory<Dio>(() => Dio());

    getIt.registerFactory<WeatherDatasource>(
      () => WeatherDatasourceImpl(restClient: getIt.get<Dio>()),
    );

    getIt.registerFactory<CityWeatherRepository>(
      () => CityWeatherRepositoryImpl(
        weatherDatasource: getIt.get<WeatherDatasource>(),
      ),
    );

    getIt.registerFactory<CityWeatherUsecase>(
      () => CityWeatherUsecaseImpl(
        cityWeatherRepository: getIt.get<CityWeatherRepository>(),
      ),
    );

    getIt.registerFactory<CityWeatherCubit>(
      () =>
          CityWeatherCubit(cityWeatherUsecase: getIt.get<CityWeatherUsecase>()),
    );
  }
}
