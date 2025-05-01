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
  rank: _toInt(json['rank']),
);

Map<String, dynamic> _$UserRankingToJson(_UserRanking instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'nickname': instance.nickname,
      'avatarUrl': instance.avatarUrl,
      'point': instance.point,
      'level': instance.level,
      'rank': instance.rank,
    };
