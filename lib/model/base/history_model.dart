import 'package:freezed_annotation/freezed_annotation.dart';

part 'history_model.freezed.dart';
part 'history_model.g.dart';

@freezed
abstract class HistoryModel with _$HistoryModel {
  factory HistoryModel({
    String? event,
    String? content,
    String? regdate,
    int? step,
  }) = _HistoryModel;

  factory HistoryModel.fromJson(Map<String, dynamic> json) =>
      _$HistoryModelFromJson(json);
}
