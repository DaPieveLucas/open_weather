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
    _cubit.getWeatherData();
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
            return const CircularProgressIndicator.adaptive();
          } else if (state is CityWeatherErrorState) {
            return const Center(
              child: Text('error'),
            );
          } else if (state is CityWeatherSuccess) {
            return const DropdownWidget();

            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'You have pushed the button this many times:',
                  ),
                  Text(
                    state.cityWeatherEntity.name,
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ],
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
