// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FeedComment _$FeedCommentFromJson(Map<String, dynamic> json) => _FeedComment(
  commentId: _toString(json['commentId']),
  feedId: _toString(json['feedId']),
  uid: _toString(json['uid']),
  nickname: _toString(json['nickname']),
  avatarUrl: _toString(json['avatarUrl']),
  text: _toString(json['text']),
  parentCommentId: _toString(json['parentCommentId']),
  likeCount: _toInt(json['likeCount']),
  reportCount: _toInt(json['reportCount']),
  createdAt: _toDateTime(json['createdAt']),
  updatedAt: _toDateTime(json['updatedAt']),
);

Map<String, dynamic> _$FeedCommentToJson(_FeedComment instance) =>
    <String, dynamic>{
      'commentId': instance.commentId,
      'feedId': instance.feedId,
      'uid': instance.uid,
      'nickname': instance.nickname,
      'avatarUrl': instance.avatarUrl,
      'text': instance.text,
      'parentCommentId': instance.parentCommentId,
      'likeCount': instance.likeCount,
      'reportCount': instance.reportCount,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
