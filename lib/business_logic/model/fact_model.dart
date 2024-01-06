import 'package:hive/hive.dart';
// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

part 'fact_model.g.dart';

@HiveType(typeId: 0)
@JsonSerializable()
class CatFact {
  @HiveField(0)
  final String text;

  @HiveField(1)
  final DateTime createdAt;

  CatFact({
    required this.text,
    required this.createdAt,
  });

  factory CatFact.fromJson(Map<String, dynamic> json) => _$CatFactFromJson(json);

  Map<String, dynamic> toJson() => _$CatFactToJson(this);
}
