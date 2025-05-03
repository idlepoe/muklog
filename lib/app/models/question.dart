import 'package:freezed_annotation/freezed_annotation.dart';

part 'question.freezed.dart';
part 'question.g.dart';

// null → '' 또는 '값'.toString()
String _toString(dynamic value) =>  value?.toString() ?? '';

// null → 0
int _toInt(dynamic value) => value is int ? value : int.tryParse(value?.toString() ?? '') ?? 0;

// null → 0.0
double _toDouble(dynamic value) => value is double
    ? value
    : double.tryParse(value?.toString() ?? '') ?? 0.0;

// null → DateTime.now()
DateTime _toDateTime(dynamic value) {
  if (value is DateTime) return value;
  if (value is String) return DateTime.tryParse(value) ?? DateTime.now();
  return DateTime.now();
}

@freezed
abstract class Question with _$Question {
  const factory Question({
    @JsonKey(fromJson: _toString) required String questionId,
    @JsonKey(fromJson: _toString) required String uid,
    @JsonKey(fromJson: _toString) required String question,
    required List<String> choices,
    @JsonKey(fromJson: _toString) required String answer,
    @JsonKey(fromJson: _toString) required String explanation,
    @JsonKey(fromJson: _toString) required String imageUrl,
    @JsonKey(fromJson: _toString) required String userPrice,
    @JsonKey(fromJson: _toString) required String type,
    @JsonKey(fromJson: _toString) required String foodName,
    @JsonKey(fromJson: _toInt) required int likeCount,
    @JsonKey(fromJson: _toInt) required int playCount,
    @JsonKey(fromJson: _toDateTime) required DateTime createdAt,
    @JsonKey(fromJson: _toDateTime) required DateTime updatedAt,
  }) = _Question;

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);
}