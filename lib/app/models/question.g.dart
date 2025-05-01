// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Question _$QuestionFromJson(Map<String, dynamic> json) => _Question(
  id: _toString(json['id']),
  imageUrl: _toString(json['imageUrl']),
  description: _toString(json['description']),
  choices: (json['choices'] as List<dynamic>).map((e) => e as String).toList(),
  answerIndex: _toInt(json['answerIndex']),
  authorUid: _toString(json['authorUid']),
  authorNickname: _toString(json['authorNickname']),
  createdAt: _toDateTime(json['createdAt']),
);

Map<String, dynamic> _$QuestionToJson(_Question instance) => <String, dynamic>{
  'id': instance.id,
  'imageUrl': instance.imageUrl,
  'description': instance.description,
  'choices': instance.choices,
  'answerIndex': instance.answerIndex,
  'authorUid': instance.authorUid,
  'authorNickname': instance.authorNickname,
  'createdAt': instance.createdAt.toIso8601String(),
};
