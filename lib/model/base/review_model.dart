import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mefood/model/base/base.dart';

part 'review_model.freezed.dart';
part 'review_model.g.dart';

@unfreezed
abstract class ReviewModel with _$ReviewModel {
  factory ReviewModel({
    int? id,
    MemberModel? user,
    String? content,
    int? rating,
    @JsonKey(name: 'type_id') int? typeId,
    String? type,
    String? regdate,
    String? other,
  }) = _ReviewModel;
  factory ReviewModel.fromJson(Map<String, dynamic> json) =>
      _$ReviewModelFromJson(json);
}
