import 'package:get_it/get_it.dart';

import '../../presentation/cubit/city_weather_cubit.dart';

class CityWeatherInject {
  cityWeatherInject(GetIt getIt) {
    getIt.registerFactory<CityWeatherCubit>(() => CityWeatherCubit());
  }
}
