import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:open_weather/core/errors/failure.dart';

import '../../domain/entities/name_entity.dart';
import '../../domain/usecases/city_weather_usecase.dart';

part 'city_weather_state.dart';

class CityWeatherCubit extends Cubit<CityWeatherState> {
  CityWeatherCubit({required CityWeatherUsecase cityWeatherUsecase})
      : _cityWeatherUsecase = cityWeatherUsecase,
        super(const CityWeatherInitial());

  final CityWeatherUsecase _cityWeatherUsecase;

  Future<void> getWeatherData({String? cityName}) async {
    emit(const CityWeatherLoading());

    final resultData = await _cityWeatherUsecase(cityName ?? '');

    resultData.fold(
      (failure) =>
          emit(CityWeatherErrorState(errorMessage: failure.message ?? '')),
      (success) => emit(
        CityWeatherSuccess(
          cityWeatherEntity: success,
          stateDropdownValue: cityName ?? '',
        ),
      ),
    );
  }
}
