import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_ranking.freezed.dart';
part 'user_ranking.g.dart';
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
abstract class UserRanking with _$UserRanking {
  const factory UserRanking({
    @JsonKey(fromJson: _toString) required String uid,
    @JsonKey(fromJson: _toString) required String nickname,
    @JsonKey(fromJson: _toString) required String avatarUrl,
    @JsonKey(fromJson: _toInt) required int point,
    @JsonKey(fromJson: _toInt) required int level,
    @JsonKey(fromJson: _toString) required String title,
    @JsonKey(fromJson: _toInt) required int questionCount,
    @JsonKey(fromJson: _toInt) required int correctRate,
    @JsonKey(fromJson: _toInt) required int playCount,
    @JsonKey(fromJson: _toDateTime) required DateTime levelUpAt,
  }) = _UserRanking;

  factory UserRanking.fromJson(Map<String, dynamic> json) =>
      _$UserRankingFromJson(json);
}