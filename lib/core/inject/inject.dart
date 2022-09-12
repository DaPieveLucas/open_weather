import 'package:get_it/get_it.dart';

import '../../app/features/home_page/core/inject/city_weather_inject.dart';

final GetIt getIt = GetIt.instance;

class Inject {
  Inject._();

  static Future<void> init() async {
    CityWeatherInject().cityWeatherInject(getIt);
  }
}
