// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Question _$QuestionFromJson(Map<String, dynamic> json) => _Question(
  questionId: _toString(json['questionId']),
  uid: _toString(json['uid']),
  question: _toString(json['question']),
  choices: (json['choices'] as List<dynamic>).map((e) => e as String).toList(),
  answer: _toString(json['answer']),
  explanation: _toString(json['explanation']),
  imageUrl: _toString(json['imageUrl']),
  userPrice: _toString(json['userPrice']),
  type: _toString(json['type']),
  foodName: _toString(json['foodName']),
  likeCount: _toInt(json['likeCount']),
  playCount: _toInt(json['playCount']),
  createdAt: _toDateTime(json['createdAt']),
  updatedAt: _toDateTime(json['updatedAt']),
);

Map<String, dynamic> _$QuestionToJson(_Question instance) => <String, dynamic>{
  'questionId': instance.questionId,
  'uid': instance.uid,
  'question': instance.question,
  'choices': instance.choices,
  'answer': instance.answer,
  'explanation': instance.explanation,
  'imageUrl': instance.imageUrl,
  'userPrice': instance.userPrice,
  'type': instance.type,
  'foodName': instance.foodName,
  'likeCount': instance.likeCount,
  'playCount': instance.playCount,
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
};
