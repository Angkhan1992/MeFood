import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@unfreezed
class UserModel with _$UserModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory UserModel({
    @JsonKey(name: 'usr_id') int? id,
    @JsonKey(name: 'usr_first_name') String? first,
    @JsonKey(name: 'usr_last_name') String? last,
    @JsonKey(name: 'usr_avatar') String? avatar,
    @JsonKey(name: 'usr_email') String? email,
    @JsonKey(name: 'usr_phone') String? phone,
    @JsonKey(name: 'usr_gender') String? gender,
    @JsonKey(name: 'usr_dob') String? dob,
    @JsonKey(name: 'usr_type') String? type,
    @JsonKey(name: 'reg_date') String? regdate,
    @JsonKey(name: 'update_date') String? updated,
    @JsonKey(name: 'is_enable') int? isEnabled,
    @JsonKey(name: 'is_deleted') int? isDeleted,
    String? other,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
