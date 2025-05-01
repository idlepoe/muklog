// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'point_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PointHistory _$PointHistoryFromJson(Map<String, dynamic> json) =>
    _PointHistory(
      id: _toString(json['id']),
      reason: _toString(json['reason']),
      amount: _toInt(json['amount']),
      balance: _toInt(json['balance']),
      createdAt: _toDateTime(json['createdAt']),
    );

Map<String, dynamic> _$PointHistoryToJson(_PointHistory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'reason': instance.reason,
      'amount': instance.amount,
      'balance': instance.balance,
      'createdAt': instance.createdAt.toIso8601String(),
    };
