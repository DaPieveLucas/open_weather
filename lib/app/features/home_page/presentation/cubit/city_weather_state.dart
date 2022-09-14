part of 'city_weather_cubit.dart';

abstract class CityWeatherState extends Equatable {
  const CityWeatherState();

  @override
  List<Object?> get props => [];
}

class CityWeatherInitial extends CityWeatherState {
  const CityWeatherInitial({this.stateDropdownValue = 'Lisbon'});

  final String stateDropdownValue;

  @override
  List<Object?> get props => [stateDropdownValue];
}

class CityWeatherLoading extends CityWeatherState {
  const CityWeatherLoading();

  @override
  List<Object?> get props => [];
}

class CityWeatherErrorState extends CityWeatherState {
  const CityWeatherErrorState({required this.errorMessage});

  final String errorMessage;

  @override
  List<Object?> get props => [errorMessage];
}

class CityWeatherSuccess extends CityWeatherState {
  const CityWeatherSuccess({
    required this.cityWeatherEntity,
    this.stateDropdownValue = 'Lisbon',
  });

  final NameEntity cityWeatherEntity;
  final String stateDropdownValue;

  CityWeatherSuccess copyWith({
    NameEntity? cityWeatherEntity,
    String? stateDropdownValue,
  }) =>
      CityWeatherSuccess(
        cityWeatherEntity: cityWeatherEntity ?? this.cityWeatherEntity,
        stateDropdownValue: stateDropdownValue ?? this.stateDropdownValue,
      );

  @override
  List<Object?> get props => [cityWeatherEntity, stateDropdownValue];
}
