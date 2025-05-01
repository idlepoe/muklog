// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generated_question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GeneratedQuestion _$GeneratedQuestionFromJson(Map<String, dynamic> json) =>
    _GeneratedQuestion(
      questionId: json['questionId'] as String?,
      question: _toString(json['question']),
      choices:
          (json['choices'] as List<dynamic>).map((e) => e as String).toList(),
      answer: _toString(json['answer']),
      explanation: _toString(json['explanation']),
      imageUrl: _toString(json['imageUrl']),
      userPrice: _toString(json['userPrice']),
      type: json['type'] as String? ?? 'objective',
      foodName: json['foodName'] as String?,
    );

Map<String, dynamic> _$GeneratedQuestionToJson(_GeneratedQuestion instance) =>
    <String, dynamic>{
      'questionId': instance.questionId,
      'question': instance.question,
      'choices': instance.choices,
      'answer': instance.answer,
      'explanation': instance.explanation,
      'imageUrl': instance.imageUrl,
      'userPrice': instance.userPrice,
      'type': instance.type,
      'foodName': instance.foodName,
    };
