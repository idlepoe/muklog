import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_summary.freezed.dart';
part 'user_summary.g.dart';

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
abstract class UserSummary with _$UserSummary {
  const factory UserSummary({
    @JsonKey(fromJson: _toString) required String uid,
    @JsonKey(fromJson: _toString) required String nickname,
    @JsonKey(fromJson: _toString) required String avatarUrl,
    @JsonKey(fromJson: _toInt) required int level,
  }) = _UserSummary;

  factory UserSummary.fromJson(Map<String, dynamic> json) => _$UserSummaryFromJson(json);
}


