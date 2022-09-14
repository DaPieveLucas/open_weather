// import 'dart:convert';

// class NameEntity {
//   final String name;
//   final MainEntity mainEntity;
//   NameEntity({
//     required this.name,
//     required this.mainEntity,
//   });
// }

// class MainEntity {
//   final double temp;
//   final double feelsLike;
//   final double tempMin;
//   final double tempMax;
//   final int pressure;
//   final int humidity;
//   MainEntity({
//     required this.temp,
//     required this.feelsLike,
//     required this.tempMin,
//     required this.tempMax,
//     required this.pressure,
//     required this.humidity,
//   });
// }

// class NameEntityModel extends NameEntity {
//   final MainEntityModel mainEntityModel;
//   NameEntityModel({
//     required super.name,
//     required super.mainEntity,
//     required this.mainEntityModel,
//   });

//   Map<String, dynamic> toMap() {
//     final result = <String, dynamic>{};

//     result.addAll({'name': name});
//     result.addAll({'mainEntity': mainEntityModel.toMap()});

//     return result;
//   }

//   factory NameEntityModel.fromMap(Map<String, dynamic> map) {
//     return NameEntityModel(
//       mainEntityModel: MainEntityModel.fromMap(map['main']),
//       name: map['name'] ?? '',
//       mainEntity: MainEntityModel.fromMap(map['mainEntity']),
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory NameEntityModel.fromJson(String source) =>
//       NameEntityModel.fromMap(json.decode(source));
// }

