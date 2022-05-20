import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_model.freezed.dart';
part 'category_model.g.dart';

@unfreezed
class CategoryModel with _$CategoryModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory CategoryModel({
    int? id,
    String? name,
    String? description,
    String? regdate,
    String? icon,
    String? other,
  }) = _CategoryModel;

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);
}
