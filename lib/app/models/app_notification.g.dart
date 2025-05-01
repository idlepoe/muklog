// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AppNotification _$AppNotificationFromJson(Map<String, dynamic> json) =>
    _AppNotification(
      id: _toString(json['id']),
      title: _toString(json['title']),
      body: _toString(json['body']),
      isRead: _toBool(json['isRead']),
      createdAt: _toDateTime(json['createdAt']),
      deepLink: _toString(json['deepLink']),
    );

Map<String, dynamic> _$AppNotificationToJson(_AppNotification instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'body': instance.body,
      'isRead': instance.isRead,
      'createdAt': instance.createdAt.toIso8601String(),
      'deepLink': instance.deepLink,
    };
