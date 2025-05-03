// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserSummary _$UserSummaryFromJson(Map<String, dynamic> json) => _UserSummary(
  uid: _toString(json['uid']),
  nickname: _toString(json['nickname']),
  avatarUrl: _toString(json['avatarUrl']),
  level: _toInt(json['level']),
);

Map<String, dynamic> _$UserSummaryToJson(_UserSummary instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'nickname': instance.nickname,
      'avatarUrl': instance.avatarUrl,
      'level': instance.level,
    };
