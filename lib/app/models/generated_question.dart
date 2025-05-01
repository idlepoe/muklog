import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated_question.freezed.dart';
part 'generated_question.g.dart';
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
abstract class GeneratedQuestion with _$GeneratedQuestion {
  const factory GeneratedQuestion({
    String? questionId, // ✅ 추가
    @JsonKey(fromJson: _toString) required String question,
    required List<String> choices,
    @JsonKey(fromJson: _toString) required String answer,
    @JsonKey(fromJson: _toString) required String explanation,
    @JsonKey(fromJson: _toString) required String imageUrl,
    @JsonKey(fromJson: _toString) required String userPrice,
    @Default('objective') String type, // 'objective' | 'ox' 등
    String? foodName,
  }) = _GeneratedQuestion;

  factory GeneratedQuestion.fromJson(Map<String, dynamic> json) =>
      _$GeneratedQuestionFromJson(json);
}
