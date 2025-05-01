// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_ranking.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserRanking {

@JsonKey(fromJson: _toString) String get uid;@JsonKey(fromJson: _toString) String get nickname;@JsonKey(fromJson: _toString) String get avatarUrl;@JsonKey(fromJson: _toInt) int get point;@JsonKey(fromJson: _toInt) int get level;@JsonKey(fromJson: _toInt) int get rank;
/// Create a copy of UserRanking
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserRankingCopyWith<UserRanking> get copyWith => _$UserRankingCopyWithImpl<UserRanking>(this as UserRanking, _$identity);

  /// Serializes this UserRanking to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserRanking&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.nickname, nickname) || other.nickname == nickname)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.point, point) || other.point == point)&&(identical(other.level, level) || other.level == level)&&(identical(other.rank, rank) || other.rank == rank));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,uid,nickname,avatarUrl,point,level,rank);

@override
String toString() {
  return 'UserRanking(uid: $uid, nickname: $nickname, avatarUrl: $avatarUrl, point: $point, level: $level, rank: $rank)';
}


}

/// @nodoc
abstract mixin class $UserRankingCopyWith<$Res>  {
  factory $UserRankingCopyWith(UserRanking value, $Res Function(UserRanking) _then) = _$UserRankingCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: _toString) String uid,@JsonKey(fromJson: _toString) String nickname,@JsonKey(fromJson: _toString) String avatarUrl,@JsonKey(fromJson: _toInt) int point,@JsonKey(fromJson: _toInt) int level,@JsonKey(fromJson: _toInt) int rank
});




}
/// @nodoc
class _$UserRankingCopyWithImpl<$Res>
    implements $UserRankingCopyWith<$Res> {
  _$UserRankingCopyWithImpl(this._self, this._then);

  final UserRanking _self;
  final $Res Function(UserRanking) _then;

/// Create a copy of UserRanking
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? uid = null,Object? nickname = null,Object? avatarUrl = null,Object? point = null,Object? level = null,Object? rank = null,}) {
  return _then(_self.copyWith(
uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,nickname: null == nickname ? _self.nickname : nickname // ignore: cast_nullable_to_non_nullable
as String,avatarUrl: null == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String,point: null == point ? _self.point : point // ignore: cast_nullable_to_non_nullable
as int,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as int,rank: null == rank ? _self.rank : rank // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _UserRanking implements UserRanking {
  const _UserRanking({@JsonKey(fromJson: _toString) required this.uid, @JsonKey(fromJson: _toString) required this.nickname, @JsonKey(fromJson: _toString) required this.avatarUrl, @JsonKey(fromJson: _toInt) required this.point, @JsonKey(fromJson: _toInt) required this.level, @JsonKey(fromJson: _toInt) required this.rank});
  factory _UserRanking.fromJson(Map<String, dynamic> json) => _$UserRankingFromJson(json);

@override@JsonKey(fromJson: _toString) final  String uid;
@override@JsonKey(fromJson: _toString) final  String nickname;
@override@JsonKey(fromJson: _toString) final  String avatarUrl;
@override@JsonKey(fromJson: _toInt) final  int point;
@override@JsonKey(fromJson: _toInt) final  int level;
@override@JsonKey(fromJson: _toInt) final  int rank;

/// Create a copy of UserRanking
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserRankingCopyWith<_UserRanking> get copyWith => __$UserRankingCopyWithImpl<_UserRanking>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserRankingToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserRanking&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.nickname, nickname) || other.nickname == nickname)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.point, point) || other.point == point)&&(identical(other.level, level) || other.level == level)&&(identical(other.rank, rank) || other.rank == rank));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,uid,nickname,avatarUrl,point,level,rank);

@override
String toString() {
  return 'UserRanking(uid: $uid, nickname: $nickname, avatarUrl: $avatarUrl, point: $point, level: $level, rank: $rank)';
}


}

/// @nodoc
abstract mixin class _$UserRankingCopyWith<$Res> implements $UserRankingCopyWith<$Res> {
  factory _$UserRankingCopyWith(_UserRanking value, $Res Function(_UserRanking) _then) = __$UserRankingCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: _toString) String uid,@JsonKey(fromJson: _toString) String nickname,@JsonKey(fromJson: _toString) String avatarUrl,@JsonKey(fromJson: _toInt) int point,@JsonKey(fromJson: _toInt) int level,@JsonKey(fromJson: _toInt) int rank
});




}
/// @nodoc
class __$UserRankingCopyWithImpl<$Res>
    implements _$UserRankingCopyWith<$Res> {
  __$UserRankingCopyWithImpl(this._self, this._then);

  final _UserRanking _self;
  final $Res Function(_UserRanking) _then;

/// Create a copy of UserRanking
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? uid = null,Object? nickname = null,Object? avatarUrl = null,Object? point = null,Object? level = null,Object? rank = null,}) {
  return _then(_UserRanking(
uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,nickname: null == nickname ? _self.nickname : nickname // ignore: cast_nullable_to_non_nullable
as String,avatarUrl: null == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String,point: null == point ? _self.point : point // ignore: cast_nullable_to_non_nullable
as int,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as int,rank: null == rank ? _self.rank : rank // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
