// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserProfile {

@JsonKey(fromJson: _toString) String get uid;@JsonKey(fromJson: _toString) String get nickname;@JsonKey(fromJson: _toString) String get avatarUrl;@JsonKey(fromJson: _toInt) int get level;@JsonKey(fromJson: _toInt) int get point;@JsonKey(fromJson: _toString) String get title;@JsonKey(fromJson: _toDateTime) DateTime get createdAt;@JsonKey(fromJson: _toDateTime) DateTime get updatedAt;@JsonKey(fromJson: _toString) String get fcmToken;@JsonKey(fromJson: _toInt) int get followerCount;@JsonKey(fromJson: _toInt) int get followingCount;@JsonKey(fromJson: _toInt) int get questionCount;@JsonKey(fromJson: _toDouble) double get correctRate;@JsonKey(fromJson: _toString) String get intro;
/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserProfileCopyWith<UserProfile> get copyWith => _$UserProfileCopyWithImpl<UserProfile>(this as UserProfile, _$identity);

  /// Serializes this UserProfile to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserProfile&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.nickname, nickname) || other.nickname == nickname)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.level, level) || other.level == level)&&(identical(other.point, point) || other.point == point)&&(identical(other.title, title) || other.title == title)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.fcmToken, fcmToken) || other.fcmToken == fcmToken)&&(identical(other.followerCount, followerCount) || other.followerCount == followerCount)&&(identical(other.followingCount, followingCount) || other.followingCount == followingCount)&&(identical(other.questionCount, questionCount) || other.questionCount == questionCount)&&(identical(other.correctRate, correctRate) || other.correctRate == correctRate)&&(identical(other.intro, intro) || other.intro == intro));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,uid,nickname,avatarUrl,level,point,title,createdAt,updatedAt,fcmToken,followerCount,followingCount,questionCount,correctRate,intro);

@override
String toString() {
  return 'UserProfile(uid: $uid, nickname: $nickname, avatarUrl: $avatarUrl, level: $level, point: $point, title: $title, createdAt: $createdAt, updatedAt: $updatedAt, fcmToken: $fcmToken, followerCount: $followerCount, followingCount: $followingCount, questionCount: $questionCount, correctRate: $correctRate, intro: $intro)';
}


}

/// @nodoc
abstract mixin class $UserProfileCopyWith<$Res>  {
  factory $UserProfileCopyWith(UserProfile value, $Res Function(UserProfile) _then) = _$UserProfileCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: _toString) String uid,@JsonKey(fromJson: _toString) String nickname,@JsonKey(fromJson: _toString) String avatarUrl,@JsonKey(fromJson: _toInt) int level,@JsonKey(fromJson: _toInt) int point,@JsonKey(fromJson: _toString) String title,@JsonKey(fromJson: _toDateTime) DateTime createdAt,@JsonKey(fromJson: _toDateTime) DateTime updatedAt,@JsonKey(fromJson: _toString) String fcmToken,@JsonKey(fromJson: _toInt) int followerCount,@JsonKey(fromJson: _toInt) int followingCount,@JsonKey(fromJson: _toInt) int questionCount,@JsonKey(fromJson: _toDouble) double correctRate,@JsonKey(fromJson: _toString) String intro
});




}
/// @nodoc
class _$UserProfileCopyWithImpl<$Res>
    implements $UserProfileCopyWith<$Res> {
  _$UserProfileCopyWithImpl(this._self, this._then);

  final UserProfile _self;
  final $Res Function(UserProfile) _then;

/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? uid = null,Object? nickname = null,Object? avatarUrl = null,Object? level = null,Object? point = null,Object? title = null,Object? createdAt = null,Object? updatedAt = null,Object? fcmToken = null,Object? followerCount = null,Object? followingCount = null,Object? questionCount = null,Object? correctRate = null,Object? intro = null,}) {
  return _then(_self.copyWith(
uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,nickname: null == nickname ? _self.nickname : nickname // ignore: cast_nullable_to_non_nullable
as String,avatarUrl: null == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as int,point: null == point ? _self.point : point // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,fcmToken: null == fcmToken ? _self.fcmToken : fcmToken // ignore: cast_nullable_to_non_nullable
as String,followerCount: null == followerCount ? _self.followerCount : followerCount // ignore: cast_nullable_to_non_nullable
as int,followingCount: null == followingCount ? _self.followingCount : followingCount // ignore: cast_nullable_to_non_nullable
as int,questionCount: null == questionCount ? _self.questionCount : questionCount // ignore: cast_nullable_to_non_nullable
as int,correctRate: null == correctRate ? _self.correctRate : correctRate // ignore: cast_nullable_to_non_nullable
as double,intro: null == intro ? _self.intro : intro // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _UserProfile implements UserProfile {
  const _UserProfile({@JsonKey(fromJson: _toString) required this.uid, @JsonKey(fromJson: _toString) required this.nickname, @JsonKey(fromJson: _toString) required this.avatarUrl, @JsonKey(fromJson: _toInt) required this.level, @JsonKey(fromJson: _toInt) required this.point, @JsonKey(fromJson: _toString) required this.title, @JsonKey(fromJson: _toDateTime) required this.createdAt, @JsonKey(fromJson: _toDateTime) required this.updatedAt, @JsonKey(fromJson: _toString) required this.fcmToken, @JsonKey(fromJson: _toInt) required this.followerCount, @JsonKey(fromJson: _toInt) required this.followingCount, @JsonKey(fromJson: _toInt) required this.questionCount, @JsonKey(fromJson: _toDouble) required this.correctRate, @JsonKey(fromJson: _toString) required this.intro});
  factory _UserProfile.fromJson(Map<String, dynamic> json) => _$UserProfileFromJson(json);

@override@JsonKey(fromJson: _toString) final  String uid;
@override@JsonKey(fromJson: _toString) final  String nickname;
@override@JsonKey(fromJson: _toString) final  String avatarUrl;
@override@JsonKey(fromJson: _toInt) final  int level;
@override@JsonKey(fromJson: _toInt) final  int point;
@override@JsonKey(fromJson: _toString) final  String title;
@override@JsonKey(fromJson: _toDateTime) final  DateTime createdAt;
@override@JsonKey(fromJson: _toDateTime) final  DateTime updatedAt;
@override@JsonKey(fromJson: _toString) final  String fcmToken;
@override@JsonKey(fromJson: _toInt) final  int followerCount;
@override@JsonKey(fromJson: _toInt) final  int followingCount;
@override@JsonKey(fromJson: _toInt) final  int questionCount;
@override@JsonKey(fromJson: _toDouble) final  double correctRate;
@override@JsonKey(fromJson: _toString) final  String intro;

/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserProfileCopyWith<_UserProfile> get copyWith => __$UserProfileCopyWithImpl<_UserProfile>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserProfileToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserProfile&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.nickname, nickname) || other.nickname == nickname)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.level, level) || other.level == level)&&(identical(other.point, point) || other.point == point)&&(identical(other.title, title) || other.title == title)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.fcmToken, fcmToken) || other.fcmToken == fcmToken)&&(identical(other.followerCount, followerCount) || other.followerCount == followerCount)&&(identical(other.followingCount, followingCount) || other.followingCount == followingCount)&&(identical(other.questionCount, questionCount) || other.questionCount == questionCount)&&(identical(other.correctRate, correctRate) || other.correctRate == correctRate)&&(identical(other.intro, intro) || other.intro == intro));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,uid,nickname,avatarUrl,level,point,title,createdAt,updatedAt,fcmToken,followerCount,followingCount,questionCount,correctRate,intro);

@override
String toString() {
  return 'UserProfile(uid: $uid, nickname: $nickname, avatarUrl: $avatarUrl, level: $level, point: $point, title: $title, createdAt: $createdAt, updatedAt: $updatedAt, fcmToken: $fcmToken, followerCount: $followerCount, followingCount: $followingCount, questionCount: $questionCount, correctRate: $correctRate, intro: $intro)';
}


}

/// @nodoc
abstract mixin class _$UserProfileCopyWith<$Res> implements $UserProfileCopyWith<$Res> {
  factory _$UserProfileCopyWith(_UserProfile value, $Res Function(_UserProfile) _then) = __$UserProfileCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: _toString) String uid,@JsonKey(fromJson: _toString) String nickname,@JsonKey(fromJson: _toString) String avatarUrl,@JsonKey(fromJson: _toInt) int level,@JsonKey(fromJson: _toInt) int point,@JsonKey(fromJson: _toString) String title,@JsonKey(fromJson: _toDateTime) DateTime createdAt,@JsonKey(fromJson: _toDateTime) DateTime updatedAt,@JsonKey(fromJson: _toString) String fcmToken,@JsonKey(fromJson: _toInt) int followerCount,@JsonKey(fromJson: _toInt) int followingCount,@JsonKey(fromJson: _toInt) int questionCount,@JsonKey(fromJson: _toDouble) double correctRate,@JsonKey(fromJson: _toString) String intro
});




}
/// @nodoc
class __$UserProfileCopyWithImpl<$Res>
    implements _$UserProfileCopyWith<$Res> {
  __$UserProfileCopyWithImpl(this._self, this._then);

  final _UserProfile _self;
  final $Res Function(_UserProfile) _then;

/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? uid = null,Object? nickname = null,Object? avatarUrl = null,Object? level = null,Object? point = null,Object? title = null,Object? createdAt = null,Object? updatedAt = null,Object? fcmToken = null,Object? followerCount = null,Object? followingCount = null,Object? questionCount = null,Object? correctRate = null,Object? intro = null,}) {
  return _then(_UserProfile(
uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,nickname: null == nickname ? _self.nickname : nickname // ignore: cast_nullable_to_non_nullable
as String,avatarUrl: null == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as int,point: null == point ? _self.point : point // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,fcmToken: null == fcmToken ? _self.fcmToken : fcmToken // ignore: cast_nullable_to_non_nullable
as String,followerCount: null == followerCount ? _self.followerCount : followerCount // ignore: cast_nullable_to_non_nullable
as int,followingCount: null == followingCount ? _self.followingCount : followingCount // ignore: cast_nullable_to_non_nullable
as int,questionCount: null == questionCount ? _self.questionCount : questionCount // ignore: cast_nullable_to_non_nullable
as int,correctRate: null == correctRate ? _self.correctRate : correctRate // ignore: cast_nullable_to_non_nullable
as double,intro: null == intro ? _self.intro : intro // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
