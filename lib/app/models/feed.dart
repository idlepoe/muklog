import 'package:freezed_annotation/freezed_annotation.dart';

import 'feed_content_block.dart';
import 'feed_quiz.dart';

part 'feed.freezed.dart';

part 'feed.g.dart';

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
abstract class Feed with _$Feed {
  const factory Feed({
    @JsonKey(fromJson: _toString) required String feedId,
    @JsonKey(fromJson: _toString) required String uid,

    @JsonKey(fromJson: _toString) required String nickname,
    @JsonKey(fromJson: _toString) required String title,
    @JsonKey(fromJson: _toInt) required int level,
    @JsonKey(fromJson: _toString) required String avatarUrl,
    required List<FeedContentBlock> contentBlocks,
    List<FeedQuiz>? quizzes, // ← 여러 개의 퀴즈
    @JsonKey(fromJson: _toInt) required int countLike,
    @JsonKey(fromJson: _toInt) required int countFunny,
    @JsonKey(fromJson: _toInt) required int countBad,
    @JsonKey(fromJson: _toInt) required int countExpensive,
    @JsonKey(fromJson: _toInt) required int countInteresting,
    @JsonKey(fromJson: _toInt) required int commentCount,
    @JsonKey(fromJson: _toDateTime) required DateTime createdAt,
    @JsonKey(fromJson: _toDateTime) required DateTime updatedAt,
  }) = _Feed;

  factory Feed.fromJson(Map<String, dynamic> json) => _$FeedFromJson(json);
}
