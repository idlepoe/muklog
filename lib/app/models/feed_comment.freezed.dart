// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feed_comment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FeedComment {

@JsonKey(fromJson: _toString) String get commentId;@JsonKey(fromJson: _toString) String get feedId;@JsonKey(fromJson: _toString) String get uid;@JsonKey(fromJson: _toString) String get nickname;@JsonKey(fromJson: _toString) String get avatarUrl;@JsonKey(fromJson: _toString) String get text;@JsonKey(fromJson: _toString) String get parentCommentId;@JsonKey(fromJson: _toInt) int get likeCount;@JsonKey(fromJson: _toInt) int get reportCount;@JsonKey(fromJson: _toDateTime) DateTime get createdAt;@JsonKey(fromJson: _toDateTime) DateTime get updatedAt;
/// Create a copy of FeedComment
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FeedCommentCopyWith<FeedComment> get copyWith => _$FeedCommentCopyWithImpl<FeedComment>(this as FeedComment, _$identity);

  /// Serializes this FeedComment to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FeedComment&&(identical(other.commentId, commentId) || other.commentId == commentId)&&(identical(other.feedId, feedId) || other.feedId == feedId)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.nickname, nickname) || other.nickname == nickname)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.text, text) || other.text == text)&&(identical(other.parentCommentId, parentCommentId) || other.parentCommentId == parentCommentId)&&(identical(other.likeCount, likeCount) || other.likeCount == likeCount)&&(identical(other.reportCount, reportCount) || other.reportCount == reportCount)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,commentId,feedId,uid,nickname,avatarUrl,text,parentCommentId,likeCount,reportCount,createdAt,updatedAt);

@override
String toString() {
  return 'FeedComment(commentId: $commentId, feedId: $feedId, uid: $uid, nickname: $nickname, avatarUrl: $avatarUrl, text: $text, parentCommentId: $parentCommentId, likeCount: $likeCount, reportCount: $reportCount, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $FeedCommentCopyWith<$Res>  {
  factory $FeedCommentCopyWith(FeedComment value, $Res Function(FeedComment) _then) = _$FeedCommentCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: _toString) String commentId,@JsonKey(fromJson: _toString) String feedId,@JsonKey(fromJson: _toString) String uid,@JsonKey(fromJson: _toString) String nickname,@JsonKey(fromJson: _toString) String avatarUrl,@JsonKey(fromJson: _toString) String text,@JsonKey(fromJson: _toString) String parentCommentId,@JsonKey(fromJson: _toInt) int likeCount,@JsonKey(fromJson: _toInt) int reportCount,@JsonKey(fromJson: _toDateTime) DateTime createdAt,@JsonKey(fromJson: _toDateTime) DateTime updatedAt
});




}
/// @nodoc
class _$FeedCommentCopyWithImpl<$Res>
    implements $FeedCommentCopyWith<$Res> {
  _$FeedCommentCopyWithImpl(this._self, this._then);

  final FeedComment _self;
  final $Res Function(FeedComment) _then;

/// Create a copy of FeedComment
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? commentId = null,Object? feedId = null,Object? uid = null,Object? nickname = null,Object? avatarUrl = null,Object? text = null,Object? parentCommentId = null,Object? likeCount = null,Object? reportCount = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
commentId: null == commentId ? _self.commentId : commentId // ignore: cast_nullable_to_non_nullable
as String,feedId: null == feedId ? _self.feedId : feedId // ignore: cast_nullable_to_non_nullable
as String,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,nickname: null == nickname ? _self.nickname : nickname // ignore: cast_nullable_to_non_nullable
as String,avatarUrl: null == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,parentCommentId: null == parentCommentId ? _self.parentCommentId : parentCommentId // ignore: cast_nullable_to_non_nullable
as String,likeCount: null == likeCount ? _self.likeCount : likeCount // ignore: cast_nullable_to_non_nullable
as int,reportCount: null == reportCount ? _self.reportCount : reportCount // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _FeedComment implements FeedComment {
  const _FeedComment({@JsonKey(fromJson: _toString) required this.commentId, @JsonKey(fromJson: _toString) required this.feedId, @JsonKey(fromJson: _toString) required this.uid, @JsonKey(fromJson: _toString) required this.nickname, @JsonKey(fromJson: _toString) required this.avatarUrl, @JsonKey(fromJson: _toString) required this.text, @JsonKey(fromJson: _toString) required this.parentCommentId, @JsonKey(fromJson: _toInt) required this.likeCount, @JsonKey(fromJson: _toInt) required this.reportCount, @JsonKey(fromJson: _toDateTime) required this.createdAt, @JsonKey(fromJson: _toDateTime) required this.updatedAt});
  factory _FeedComment.fromJson(Map<String, dynamic> json) => _$FeedCommentFromJson(json);

@override@JsonKey(fromJson: _toString) final  String commentId;
@override@JsonKey(fromJson: _toString) final  String feedId;
@override@JsonKey(fromJson: _toString) final  String uid;
@override@JsonKey(fromJson: _toString) final  String nickname;
@override@JsonKey(fromJson: _toString) final  String avatarUrl;
@override@JsonKey(fromJson: _toString) final  String text;
@override@JsonKey(fromJson: _toString) final  String parentCommentId;
@override@JsonKey(fromJson: _toInt) final  int likeCount;
@override@JsonKey(fromJson: _toInt) final  int reportCount;
@override@JsonKey(fromJson: _toDateTime) final  DateTime createdAt;
@override@JsonKey(fromJson: _toDateTime) final  DateTime updatedAt;

/// Create a copy of FeedComment
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FeedCommentCopyWith<_FeedComment> get copyWith => __$FeedCommentCopyWithImpl<_FeedComment>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FeedCommentToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FeedComment&&(identical(other.commentId, commentId) || other.commentId == commentId)&&(identical(other.feedId, feedId) || other.feedId == feedId)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.nickname, nickname) || other.nickname == nickname)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.text, text) || other.text == text)&&(identical(other.parentCommentId, parentCommentId) || other.parentCommentId == parentCommentId)&&(identical(other.likeCount, likeCount) || other.likeCount == likeCount)&&(identical(other.reportCount, reportCount) || other.reportCount == reportCount)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,commentId,feedId,uid,nickname,avatarUrl,text,parentCommentId,likeCount,reportCount,createdAt,updatedAt);

@override
String toString() {
  return 'FeedComment(commentId: $commentId, feedId: $feedId, uid: $uid, nickname: $nickname, avatarUrl: $avatarUrl, text: $text, parentCommentId: $parentCommentId, likeCount: $likeCount, reportCount: $reportCount, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$FeedCommentCopyWith<$Res> implements $FeedCommentCopyWith<$Res> {
  factory _$FeedCommentCopyWith(_FeedComment value, $Res Function(_FeedComment) _then) = __$FeedCommentCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: _toString) String commentId,@JsonKey(fromJson: _toString) String feedId,@JsonKey(fromJson: _toString) String uid,@JsonKey(fromJson: _toString) String nickname,@JsonKey(fromJson: _toString) String avatarUrl,@JsonKey(fromJson: _toString) String text,@JsonKey(fromJson: _toString) String parentCommentId,@JsonKey(fromJson: _toInt) int likeCount,@JsonKey(fromJson: _toInt) int reportCount,@JsonKey(fromJson: _toDateTime) DateTime createdAt,@JsonKey(fromJson: _toDateTime) DateTime updatedAt
});




}
/// @nodoc
class __$FeedCommentCopyWithImpl<$Res>
    implements _$FeedCommentCopyWith<$Res> {
  __$FeedCommentCopyWithImpl(this._self, this._then);

  final _FeedComment _self;
  final $Res Function(_FeedComment) _then;

/// Create a copy of FeedComment
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? commentId = null,Object? feedId = null,Object? uid = null,Object? nickname = null,Object? avatarUrl = null,Object? text = null,Object? parentCommentId = null,Object? likeCount = null,Object? reportCount = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_FeedComment(
commentId: null == commentId ? _self.commentId : commentId // ignore: cast_nullable_to_non_nullable
as String,feedId: null == feedId ? _self.feedId : feedId // ignore: cast_nullable_to_non_nullable
as String,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,nickname: null == nickname ? _self.nickname : nickname // ignore: cast_nullable_to_non_nullable
as String,avatarUrl: null == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,parentCommentId: null == parentCommentId ? _self.parentCommentId : parentCommentId // ignore: cast_nullable_to_non_nullable
as String,likeCount: null == likeCount ? _self.likeCount : likeCount // ignore: cast_nullable_to_non_nullable
as int,reportCount: null == reportCount ? _self.reportCount : reportCount // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
