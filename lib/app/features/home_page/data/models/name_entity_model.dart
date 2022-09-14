import 'dart:convert';

import 'package:open_weather/app/features/home_page/data/models/main_entity_model.dart';

import '../../domain/entities/name_entity.dart';

class NameEntityModel extends NameEntity {
  factory NameEntityModel.fromJson(String source) =>
      NameEntityModel.fromMap(json.decode(source));

  factory NameEntityModel.fromMap(Map<String, dynamic> map) {
    return NameEntityModel(
      mainEntityModel: MainEntityModel.fromMap(map['main']),
      name: map['name'] ?? '',
      mainEntity: MainEntityModel.fromMap(map['main']),
    );
  }
  NameEntityModel({
    required super.name,
    required super.mainEntity,
    required this.mainEntityModel,
  });
  final MainEntityModel mainEntityModel;

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'name': name});
    result.addAll({'main': mainEntityModel.toMap()});

    return result;
  }

  String toJson() => json.encode(toMap());
}
