import 'package:freezed_annotation/freezed_annotation.dart';

part 'feed_content_block.freezed.dart';
part 'feed_content_block.g.dart';
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
abstract class FeedContentBlock with _$FeedContentBlock {
  const factory FeedContentBlock.image({
    @JsonKey(fromJson: _toString) required String value,
  }) = FeedContentImage;

  const factory FeedContentBlock.text({
    @JsonKey(fromJson: _toString) required String value,
  }) = FeedContentText;

  factory FeedContentBlock.fromJson(Map<String, dynamic> json) =>
      _$FeedContentBlockFromJson(json);
}
