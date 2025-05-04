// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_quiz.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FeedQuiz _$FeedQuizFromJson(Map<String, dynamic> json) => _FeedQuiz(
  imageUrl: _toString(json['imageUrl']),
  question: _toString(json['question']),
  choices: (json['choices'] as List<dynamic>).map((e) => e as String).toList(),
  answer: _toString(json['answer']),
  rewardPoint: _toInt(json['rewardPoint']),
);

Map<String, dynamic> _$FeedQuizToJson(_FeedQuiz instance) => <String, dynamic>{
  'imageUrl': instance.imageUrl,
  'question': instance.question,
  'choices': instance.choices,
  'answer': instance.answer,
  'rewardPoint': instance.rewardPoint,
};
