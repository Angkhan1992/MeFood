import 'package:freezed_annotation/freezed_annotation.dart';

part 'center_model.freezed.dart';
part 'center_model.g.dart';

@unfreezed
abstract class CenterModel with _$CenterModel {
  factory CenterModel({
    int? id,
    String? name,
    String? lat,
    String? lon,
    int? adr_id,
    String? email,
    String? phone,
    String? opentime,
    String? regdate,
    String? other,
  }) = _CenterModel;
  factory CenterModel.fromJson(Map<String, dynamic> json) =>
      _$CenterModelFromJson(json);
}
