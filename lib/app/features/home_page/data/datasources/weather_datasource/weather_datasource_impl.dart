import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:open_weather/app/features/home_page/data/datasources/weather_datasource/weather_datasource.dart';
import 'package:open_weather/core/errors/failure.dart';

import '../../../../../../utils/network_address.dart';
import '../../../domain/entities/name_entity.dart';
import '../../models/name_entity_model.dart';

class WeatherDatasourceImpl implements WeatherDatasource {
  WeatherDatasourceImpl({required Dio restClient}) : _restClient = restClient;
  final Dio _restClient;
  final String kbaseUrl = NetworkAddress.kBaseUrl;

  @override
  Future<NameEntity> call(String cityName) async {
    try {
      final response = await _restClient.get(
        '${kbaseUrl}weather?q=$cityName&units=metric&APPID=2cc04d48ec5cd5960b6e48246a7646ff',
      );
      log('${response.data}');
      return NameEntityModel.fromMap(
        response.data,
      );
    } on DioError catch (e, s) {
      log('this error message:', error: e, stackTrace: s);
      throw ServerFailure(message: 'It was not possible to get any data');
    } on ServerFailure catch (e, s) {
      log('this server failure message:', stackTrace: s, error: e);
      throw ServerFailure(message: 'It was not possible to get any data');
    } catch (e, s) {
      log('this server failure message:', stackTrace: s, error: e);
      throw ServerFailure(message: 'Generic error');
    }
  }
}
