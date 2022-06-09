import 'package:freezed_annotation/freezed_annotation.dart';

part 'support_model.freezed.dart';
part 'support_model.g.dart';

@unfreezed
class SupportModel with _$SupportModel {
  factory SupportModel({
    int? id,
    String? email,
    String? type,
    String? category,
    String? content,
    String? regdate,
    String? status,
  }) = _SupportModel;

  factory SupportModel.fromJson(Map<String, dynamic> json) =>
      _$SupportModelFromJson(json);
}
