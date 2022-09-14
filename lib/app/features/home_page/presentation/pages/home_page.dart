import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/city_weather_cubit.dart';
import '../widgets/dropdown_widget.dart';

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
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
      body: BlocBuilder<CityWeatherCubit, CityWeatherState>(
        builder: (context, state) {
          if (state is CityWeatherLoading) {
            return const Center(child: CircularProgressIndicator.adaptive());
          } else if (state is CityWeatherErrorState) {
            //TODO arrumar o estado de erro
            return Center(
              child: Text(state.errorMessage),
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
                Text(state.cityWeatherEntity.mainEntity.humidity.toString()),
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.blue,
                )
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
            //TODO retornar estado de erro
            return const SizedBox();
          }
        },
      ),
    );
  }
}
