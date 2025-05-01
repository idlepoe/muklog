// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'answer_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AnswerResult _$AnswerResultFromJson(Map<String, dynamic> json) =>
    _AnswerResult(
      isCorrect: _toBool(json['isCorrect']),
      correctAnswerIndex: _toInt(json['correctAnswerIndex']),
      earnedPoint: _toInt(json['earnedPoint']),
      comment: _toString(json['comment']),
    );

Map<String, dynamic> _$AnswerResultToJson(_AnswerResult instance) =>
    <String, dynamic>{
      'isCorrect': instance.isCorrect,
      'correctAnswerIndex': instance.correctAnswerIndex,
      'earnedPoint': instance.earnedPoint,
      'comment': instance.comment,
    };
