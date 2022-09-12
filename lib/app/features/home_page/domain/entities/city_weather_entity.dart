// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:open_weather/app/features/home_page/data/models/main_data_model.dart';

class CityWeatherEntity {
  final String name;
  final MainDataModel mainDataModel;

  CityWeatherEntity({
    required this.name,
    required this.mainDataModel,
  });

  @override
  bool operator ==(covariant CityWeatherEntity other) {
    if (identical(this, other)) {
      return true;
    }

    return other.name == name && other.mainDataModel == mainDataModel;
  }

  @override
  int get hashCode => name.hashCode ^ mainDataModel.hashCode;
}