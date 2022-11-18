import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part "test_model.g.dart";

@JsonSerializable()
class TestModel extends INetworkModel<TestModel> {
  TestModel({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  int? userId;
  int? id;
  String? title;
  String? body;

  @override
  TestModel fromJson(Map<String, dynamic> json) {
    return _$TestModelFromJson(json);
  }

  @override
  Map<String, dynamic>? toJson() {
    return _$TestModelToJson(this);
  }
}
