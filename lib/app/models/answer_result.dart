import 'package:freezed_annotation/freezed_annotation.dart';

part 'answer_result.freezed.dart';
part 'answer_result.g.dart';
// null → '' 또는 '값'.toString()
String _toString(dynamic value) =>  value?.toString() ?? '';

// null → 0
int _toInt(dynamic value) => value is int ? value : int.tryParse(value?.toString() ?? '') ?? 0;

// null → 0.0
double _toDouble(dynamic value) => value is double
    ? value
    : double.tryParse(value?.toString() ?? '') ?? 0.0;

// null → 0.0
bool _toBool(dynamic value) => value is bool
    ? value
    : false;

// null → DateTime.now()
DateTime _toDateTime(dynamic value) {
  if (value is DateTime) return value;
  if (value is String) return DateTime.tryParse(value) ?? DateTime.now();
  return DateTime.now();
}

@freezed
abstract class AnswerResult with _$AnswerResult {
  const factory AnswerResult({
    @JsonKey(fromJson: _toBool) required bool isCorrect,
    @JsonKey(fromJson: _toInt) required int correctAnswerIndex,
    @JsonKey(fromJson: _toInt) required int earnedPoint,
    @JsonKey(fromJson: _toString) String? comment,
  }) = _AnswerResult;

  factory AnswerResult.fromJson(Map<String, dynamic> json) =>
      _$AnswerResultFromJson(json);
}
