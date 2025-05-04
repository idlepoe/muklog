import 'package:freezed_annotation/freezed_annotation.dart';

import 'feed_content_block.dart';
import 'feed_quiz.dart';

part 'feed_comment.freezed.dart';

part 'feed_comment.g.dart';

// null → '' 또는 '값'.toString()
String _toString(dynamic value) => value?.toString() ?? '';

// null → 0
int _toInt(dynamic value) =>
    value is int ? value : int.tryParse(value?.toString() ?? '') ?? 0;

// null → 0.0
double _toDouble(dynamic value) =>
    value is double ? value : double.tryParse(value?.toString() ?? '') ?? 0.0;

// null → 0.0
bool _toBool(dynamic value) => value is bool ? value : false;

// null → DateTime.now()
DateTime _toDateTime(dynamic value) {
  if (value is DateTime) return value;
  if (value is String) return DateTime.tryParse(value) ?? DateTime.now();
  return DateTime.now();
}

@freezed
abstract class FeedComment with _$FeedComment {
  const factory FeedComment({
    @JsonKey(fromJson: _toString) required String commentId,
    @JsonKey(fromJson: _toString) required String feedId,
    @JsonKey(fromJson: _toString) required String uid,
    @JsonKey(fromJson: _toString) required String nickname,
    @JsonKey(fromJson: _toString) required String avatarUrl,
    @JsonKey(fromJson: _toString) required String text,
    @JsonKey(fromJson: _toString) required String parentCommentId,
    @JsonKey(fromJson: _toInt) required int likeCount,
    @JsonKey(fromJson: _toInt) required int reportCount,
    @JsonKey(fromJson: _toDateTime) required DateTime createdAt,
    @JsonKey(fromJson: _toDateTime) required DateTime updatedAt,
  }) = _FeedComment;

  factory FeedComment.fromJson(Map<String, dynamic> json) =>
      _$FeedCommentFromJson(json);
}
