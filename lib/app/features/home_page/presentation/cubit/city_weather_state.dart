part of 'city_weather_cubit.dart';

abstract class CityWeatherState extends Equatable {
  const CityWeatherState();

  @override
  List<Object?> get props => [];
}

class CityWeatherInitial extends CityWeatherState {
  const CityWeatherInitial();

  @override
  List<Object?> get props => [];
}

class CityWeatherLoading extends CityWeatherState {
  const CityWeatherLoading();

  @override
  List<Object?> get props => [];
}

class CityWeatherErrorState extends CityWeatherState {
  const CityWeatherErrorState();

  @override
  List<Object?> get props => [];
}

class CityWeatherSuccess extends CityWeatherState {
  const CityWeatherSuccess({required this.cityWeatherEntity});

  final CityWeatherEntity cityWeatherEntity;

  CityWeatherSuccess copyWith({CityWeatherEntity? cityWeatherEntity}) =>
      CityWeatherSuccess(
        cityWeatherEntity: cityWeatherEntity ?? this.cityWeatherEntity,
      );

  @override
  List<Object?> get props => [];
}
