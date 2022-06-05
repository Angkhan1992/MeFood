import 'package:freezed_annotation/freezed_annotation.dart';

part 'mail_model.freezed.dart';
part 'mail_model.g.dart';

@unfreezed
class MailModel with _$MailModel {
  factory MailModel({
    int? id,
    String? title,
    String? subtitle,
    String? content,
    String? regdate,
    String? status,
    String? other,
  }) = _MailModel;

  factory MailModel.fromJson(Map<String, dynamic> json) =>
      _$MailModelFromJson(json);
}
