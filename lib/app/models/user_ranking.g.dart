// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_ranking.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserRanking _$UserRankingFromJson(Map<String, dynamic> json) => _UserRanking(
  uid: _toString(json['uid']),
  nickname: _toString(json['nickname']),
  avatarUrl: _toString(json['avatarUrl']),
  point: _toInt(json['point']),
  level: _toInt(json['level']),
  title: _toString(json['title']),
  questionCount: _toInt(json['questionCount']),
  correctRate: _toInt(json['correctRate']),
  playCount: _toInt(json['playCount']),
  levelUpAt: _toDateTime(json['levelUpAt']),
);

Map<String, dynamic> _$UserRankingToJson(_UserRanking instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'nickname': instance.nickname,
      'avatarUrl': instance.avatarUrl,
      'point': instance.point,
      'level': instance.level,
      'title': instance.title,
      'questionCount': instance.questionCount,
      'correctRate': instance.correctRate,
      'playCount': instance.playCount,
      'levelUpAt': instance.levelUpAt.toIso8601String(),
    };
