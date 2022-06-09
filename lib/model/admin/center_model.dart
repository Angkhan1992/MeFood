import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mefood/model/model.dart';

part 'center_model.freezed.dart';
part 'center_model.g.dart';

@unfreezed
abstract class CenterModel with _$CenterModel {
  factory CenterModel({
    int? id,
    @JsonKey(name: 'open_time') String? opentime,
    String? regdate,
    String? other,
    // extend fields
    MemberModel? member,
    AddressModel? address,
  }) = _CenterModel;

  factory CenterModel.fromJson(Map<String, dynamic> json) =>
      _$CenterModelFromJson(json);
}
