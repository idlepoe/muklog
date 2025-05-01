import 'package:freezed_annotation/freezed_annotation.dart';

part 'point_history.freezed.dart';
part 'point_history.g.dart';
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
abstract class PointHistory with _$PointHistory {
  const factory PointHistory({
    @JsonKey(fromJson: _toString) required String id,
    @JsonKey(fromJson: _toString) required String reason,
    @JsonKey(fromJson: _toInt) required int amount,
    @JsonKey(fromJson: _toInt) required int balance,
    @JsonKey(fromJson: _toDateTime) required DateTime createdAt,
  }) = _PointHistory;

  factory PointHistory.fromJson(Map<String, dynamic> json) =>
      _$PointHistoryFromJson(json);
}
