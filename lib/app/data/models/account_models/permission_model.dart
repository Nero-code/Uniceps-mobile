// import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uniceps/app/domain/classes/account_entities/permission.dart';

part 'permission_model.g.dart';

@JsonSerializable()
class PermissionModel {
  final Actions action;
  final int? maxCount;

  bool get isUnlimited => maxCount == null;
  bool can(Actions p, int current) =>
      action == p && (isUnlimited || current < maxCount!);

  const PermissionModel({required this.action, this.maxCount});

  factory PermissionModel.fromJson(Map<String, dynamic> json) =>
      _$PermissionModelFromJson(json);

  Map<String, dynamic> toJson() => _$PermissionModelToJson(this);

  factory PermissionModel.fromEntity(Permission p) =>
      PermissionModel(action: p.action, maxCount: p.maxCount);

  Permission toEntity() => Permission(action: action, maxCount: maxCount);
}
