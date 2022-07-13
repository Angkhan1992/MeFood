// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_HistoryModel _$$_HistoryModelFromJson(Map<String, dynamic> json) =>
    _$_HistoryModel(
      event: json['event'] as String?,
      content: json['content'] as String?,
      regdate: json['regdate'] as String?,
      step: json['step'] as int?,
    );

Map<String, dynamic> _$$_HistoryModelToJson(_$_HistoryModel instance) =>
    <String, dynamic>{
      'event': instance.event,
      'content': instance.content,
      'regdate': instance.regdate,
      'step': instance.step,
    };
