import 'package:freezed_annotation/freezed_annotation.dart';

part 'member_model.freezed.dart';
part 'member_model.g.dart';

@unfreezed
class MemberModel with _$MemberModel {
  factory MemberModel({
    int? id,
    int? ret_id,
    String? name,
    String? email,
    String? phone,
    String? regdate,
    String? type,
  }) = _MemberModel;
  factory MemberModel.fromJson(Map<String, dynamic> json) =>
      _$MemberModelFromJson(json);
}
