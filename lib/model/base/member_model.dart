import 'package:freezed_annotation/freezed_annotation.dart';

part 'member_model.freezed.dart';
part 'member_model.g.dart';

@unfreezed
class MemberModel with _$MemberModel {
  factory MemberModel({
    int? id,
    @JsonKey(name: 'first_name') String? firstName,
    @JsonKey(name: 'last_name') String? lastName,
    String? email,
    String? gender,
    String? dob,
    @JsonKey(name: 'auth_email') int? authEmail,
    @JsonKey(name: 'auth_type') String? authType,
    String? phone,
    @JsonKey(name: 'auth_phone') int? authPhone,
    @JsonKey(name: 'member_type') String? memberType,
    @JsonKey(name: 'id_type') int? typeId,
    String? regdate,
    String? update,
    int? enabled,
    int? deleted,
    // extend fields
    String? linkAvatar,
    String? linkIdCard,
  }) = _MemberModel;

  factory MemberModel.fromJson(Map<String, dynamic> json) =>
      _$MemberModelFromJson(json);
}
