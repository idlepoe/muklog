// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserProfile _$UserProfileFromJson(Map<String, dynamic> json) => _UserProfile(
  uid: _toString(json['uid']),
  nickname: _toString(json['nickname']),
  avatarUrl: _toString(json['avatarUrl']),
  level: _toInt(json['level']),
  point: _toInt(json['point']),
  title: _toString(json['title']),
  createdAt: _toDateTime(json['createdAt']),
  updatedAt: _toDateTime(json['updatedAt']),
  fcmToken: _toString(json['fcmToken']),
  followerCount: _toInt(json['followerCount']),
  followingCount: _toInt(json['followingCount']),
  questionCount: _toInt(json['questionCount']),
  correctRate: _toDouble(json['correctRate']),
  intro: _toString(json['intro']),
);

Map<String, dynamic> _$UserProfileToJson(_UserProfile instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'nickname': instance.nickname,
      'avatarUrl': instance.avatarUrl,
      'level': instance.level,
      'point': instance.point,
      'title': instance.title,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'fcmToken': instance.fcmToken,
      'followerCount': instance.followerCount,
      'followingCount': instance.followingCount,
      'questionCount': instance.questionCount,
      'correctRate': instance.correctRate,
      'intro': instance.intro,
    };
