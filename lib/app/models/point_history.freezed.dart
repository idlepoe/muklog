// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'point_history.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PointHistory {

@JsonKey(fromJson: _toString) String get id;@JsonKey(fromJson: _toString) String get reason;@JsonKey(fromJson: _toInt) int get amount;@JsonKey(fromJson: _toInt) int get balance;@JsonKey(fromJson: _toDateTime) DateTime get createdAt;
/// Create a copy of PointHistory
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PointHistoryCopyWith<PointHistory> get copyWith => _$PointHistoryCopyWithImpl<PointHistory>(this as PointHistory, _$identity);

  /// Serializes this PointHistory to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PointHistory&&(identical(other.id, id) || other.id == id)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.balance, balance) || other.balance == balance)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,reason,amount,balance,createdAt);

@override
String toString() {
  return 'PointHistory(id: $id, reason: $reason, amount: $amount, balance: $balance, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $PointHistoryCopyWith<$Res>  {
  factory $PointHistoryCopyWith(PointHistory value, $Res Function(PointHistory) _then) = _$PointHistoryCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: _toString) String id,@JsonKey(fromJson: _toString) String reason,@JsonKey(fromJson: _toInt) int amount,@JsonKey(fromJson: _toInt) int balance,@JsonKey(fromJson: _toDateTime) DateTime createdAt
});




}
/// @nodoc
class _$PointHistoryCopyWithImpl<$Res>
    implements $PointHistoryCopyWith<$Res> {
  _$PointHistoryCopyWithImpl(this._self, this._then);

  final PointHistory _self;
  final $Res Function(PointHistory) _then;

/// Create a copy of PointHistory
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? reason = null,Object? amount = null,Object? balance = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int,balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _PointHistory implements PointHistory {
  const _PointHistory({@JsonKey(fromJson: _toString) required this.id, @JsonKey(fromJson: _toString) required this.reason, @JsonKey(fromJson: _toInt) required this.amount, @JsonKey(fromJson: _toInt) required this.balance, @JsonKey(fromJson: _toDateTime) required this.createdAt});
  factory _PointHistory.fromJson(Map<String, dynamic> json) => _$PointHistoryFromJson(json);

@override@JsonKey(fromJson: _toString) final  String id;
@override@JsonKey(fromJson: _toString) final  String reason;
@override@JsonKey(fromJson: _toInt) final  int amount;
@override@JsonKey(fromJson: _toInt) final  int balance;
@override@JsonKey(fromJson: _toDateTime) final  DateTime createdAt;

/// Create a copy of PointHistory
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PointHistoryCopyWith<_PointHistory> get copyWith => __$PointHistoryCopyWithImpl<_PointHistory>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PointHistoryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PointHistory&&(identical(other.id, id) || other.id == id)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.balance, balance) || other.balance == balance)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,reason,amount,balance,createdAt);

@override
String toString() {
  return 'PointHistory(id: $id, reason: $reason, amount: $amount, balance: $balance, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$PointHistoryCopyWith<$Res> implements $PointHistoryCopyWith<$Res> {
  factory _$PointHistoryCopyWith(_PointHistory value, $Res Function(_PointHistory) _then) = __$PointHistoryCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: _toString) String id,@JsonKey(fromJson: _toString) String reason,@JsonKey(fromJson: _toInt) int amount,@JsonKey(fromJson: _toInt) int balance,@JsonKey(fromJson: _toDateTime) DateTime createdAt
});




}
/// @nodoc
class __$PointHistoryCopyWithImpl<$Res>
    implements _$PointHistoryCopyWith<$Res> {
  __$PointHistoryCopyWithImpl(this._self, this._then);

  final _PointHistory _self;
  final $Res Function(_PointHistory) _then;

/// Create a copy of PointHistory
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? reason = null,Object? amount = null,Object? balance = null,Object? createdAt = null,}) {
  return _then(_PointHistory(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int,balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
