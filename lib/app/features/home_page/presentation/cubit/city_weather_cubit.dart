import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entities/city_weather_entity.dart';
import '../../domain/usecases/city_weather_usecase.dart';

part 'city_weather_state.dart';

class CityWeatherCubit extends Cubit<CityWeatherState> {
  CityWeatherCubit({required CityWeatherUsecase cityWeatherUsecase})
      : _cityWeatherUsecase = cityWeatherUsecase,
        super(const CityWeatherInitial());

  final CityWeatherUsecase _cityWeatherUsecase;

  Future<void> getWeatherData() async {
    emit(const CityWeatherLoading());

    final resultData = await _cityWeatherUsecase();

    resultData.fold(
      (failure) => emit(const CityWeatherErrorState()),
      (success) => emit(CityWeatherSuccess(cityWeatherEntity: success)),
    );
  }
}
