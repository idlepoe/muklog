import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_notification.freezed.dart';
part 'app_notification.g.dart';
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
abstract class AppNotification with _$AppNotification {
  const factory AppNotification({
    @JsonKey(fromJson: _toString) required String id,
    @JsonKey(fromJson: _toString) required String title,
    @JsonKey(fromJson: _toString) required String body,
    @JsonKey(fromJson: _toBool) required bool isRead,
    @JsonKey(fromJson: _toDateTime) required DateTime createdAt,
    @JsonKey(fromJson: _toString) String? deepLink,
  }) = _AppNotification;

  factory AppNotification.fromJson(Map<String, dynamic> json) =>
      _$AppNotificationFromJson(json);
}
