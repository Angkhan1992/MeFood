import 'package:freezed_annotation/freezed_annotation.dart';

part 'history_model.freezed.dart';
part 'history_model.g.dart';

@freezed
class HistoryModel with _$HistoryModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory HistoryModel({
    String? id,
    double? distance,
    double? price,
    String? date,
  }) = _HistoryModel;

  factory HistoryModel.fromJson(Map<String, dynamic> json) =>
      _$HistoryModelFromJson(json);
}
