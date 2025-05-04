// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Feed _$FeedFromJson(Map<String, dynamic> json) => _Feed(
  feedId: _toString(json['feedId']),
  uid: _toString(json['uid']),
  nickname: _toString(json['nickname']),
  title: _toString(json['title']),
  level: _toInt(json['level']),
  avatarUrl: _toString(json['avatarUrl']),
  contentBlocks:
      (json['contentBlocks'] as List<dynamic>)
          .map((e) => FeedContentBlock.fromJson(e as Map<String, dynamic>))
          .toList(),
  quizzes:
      (json['quizzes'] as List<dynamic>?)
          ?.map((e) => FeedQuiz.fromJson(e as Map<String, dynamic>))
          .toList(),
  countLike: _toInt(json['countLike']),
  countFunny: _toInt(json['countFunny']),
  countBad: _toInt(json['countBad']),
  countExpensive: _toInt(json['countExpensive']),
  countInteresting: _toInt(json['countInteresting']),
  commentCount: _toInt(json['commentCount']),
  createdAt: _toDateTime(json['createdAt']),
  updatedAt: _toDateTime(json['updatedAt']),
);

Map<String, dynamic> _$FeedToJson(_Feed instance) => <String, dynamic>{
  'feedId': instance.feedId,
  'uid': instance.uid,
  'nickname': instance.nickname,
  'title': instance.title,
  'level': instance.level,
  'avatarUrl': instance.avatarUrl,
  'contentBlocks': instance.contentBlocks,
  'quizzes': instance.quizzes,
  'countLike': instance.countLike,
  'countFunny': instance.countFunny,
  'countBad': instance.countBad,
  'countExpensive': instance.countExpensive,
  'countInteresting': instance.countInteresting,
  'commentCount': instance.commentCount,
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
};
