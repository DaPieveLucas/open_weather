import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../utils/app_images.dart';
import '../cubit/city_weather_cubit.dart';
import '../widgets/dropdown_widget.dart';
import '../widgets/grid_view_widget.dart';
import '../widgets/show_error_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late CityWeatherCubit _cubit;

  @override
  void initState() {
    super.initState();

    _cubit = context.read<CityWeatherCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Forecasts',
          style: TextStyle(fontSize: 22, color: Colors.white),
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  AppImages.background,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          BlocBuilder<CityWeatherCubit, CityWeatherState>(
            builder: (context, state) {
              if (state is CityWeatherLoading) {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              } else if (state is CityWeatherErrorState) {
                return ShowErrorWidget(
                  errorMessage: state.errorMessage,
                );
              } else if (state is CityWeatherSuccess) {
                return Column(
                  children: [
                    DropdownWidget(
                      dropdownValue: state.stateDropdownValue,
                      onChanged: (String? value) {
                        _cubit.getWeatherData(
                          cityName: value ?? state.stateDropdownValue,
                        );
                      },
                    ),
                    GridViewWidget(
                      temperature: state.cityWeatherEntity.mainEntity.temp
                          .toStringAsFixed(0),
                      feelsLike: state.cityWeatherEntity.mainEntity.feelsLike
                          .toStringAsFixed(0),
                      humidity: state.cityWeatherEntity.mainEntity.humidity
                          .toStringAsFixed(0),
                      pressure: state.cityWeatherEntity.mainEntity.pressure
                          .toStringAsFixed(0),
                      tempMax: state.cityWeatherEntity.mainEntity.tempMax
                          .toStringAsFixed(0),
                      tempMin: state.cityWeatherEntity.mainEntity.tempMin
                          .toStringAsFixed(0),
                    ),
                  ],
                );
              } else if (state is CityWeatherInitial) {
                return DropdownWidget(
                  dropdownValue: state.stateDropdownValue,
                  onChanged: (String? value) {
                    _cubit.getWeatherData(
                      cityName: value ?? state.stateDropdownValue,
                    );
                  },
                );
              } else {
                return const ShowErrorWidget(
                  errorMessage: 'did not have any return',
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
