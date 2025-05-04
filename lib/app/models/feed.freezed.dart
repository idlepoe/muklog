// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feed.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Feed {

@JsonKey(fromJson: _toString) String get feedId;@JsonKey(fromJson: _toString) String get uid;@JsonKey(fromJson: _toString) String get nickname;@JsonKey(fromJson: _toString) String get title;@JsonKey(fromJson: _toInt) int get level;@JsonKey(fromJson: _toString) String get avatarUrl; List<FeedContentBlock> get contentBlocks; List<FeedQuiz>? get quizzes;// ← 여러 개의 퀴즈
@JsonKey(fromJson: _toInt) int get countLike;@JsonKey(fromJson: _toInt) int get countFunny;@JsonKey(fromJson: _toInt) int get countBad;@JsonKey(fromJson: _toInt) int get countExpensive;@JsonKey(fromJson: _toInt) int get countInteresting;@JsonKey(fromJson: _toInt) int get commentCount;@JsonKey(fromJson: _toDateTime) DateTime get createdAt;@JsonKey(fromJson: _toDateTime) DateTime get updatedAt;
/// Create a copy of Feed
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FeedCopyWith<Feed> get copyWith => _$FeedCopyWithImpl<Feed>(this as Feed, _$identity);

  /// Serializes this Feed to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Feed&&(identical(other.feedId, feedId) || other.feedId == feedId)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.nickname, nickname) || other.nickname == nickname)&&(identical(other.title, title) || other.title == title)&&(identical(other.level, level) || other.level == level)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&const DeepCollectionEquality().equals(other.contentBlocks, contentBlocks)&&const DeepCollectionEquality().equals(other.quizzes, quizzes)&&(identical(other.countLike, countLike) || other.countLike == countLike)&&(identical(other.countFunny, countFunny) || other.countFunny == countFunny)&&(identical(other.countBad, countBad) || other.countBad == countBad)&&(identical(other.countExpensive, countExpensive) || other.countExpensive == countExpensive)&&(identical(other.countInteresting, countInteresting) || other.countInteresting == countInteresting)&&(identical(other.commentCount, commentCount) || other.commentCount == commentCount)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,feedId,uid,nickname,title,level,avatarUrl,const DeepCollectionEquality().hash(contentBlocks),const DeepCollectionEquality().hash(quizzes),countLike,countFunny,countBad,countExpensive,countInteresting,commentCount,createdAt,updatedAt);

@override
String toString() {
  return 'Feed(feedId: $feedId, uid: $uid, nickname: $nickname, title: $title, level: $level, avatarUrl: $avatarUrl, contentBlocks: $contentBlocks, quizzes: $quizzes, countLike: $countLike, countFunny: $countFunny, countBad: $countBad, countExpensive: $countExpensive, countInteresting: $countInteresting, commentCount: $commentCount, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $FeedCopyWith<$Res>  {
  factory $FeedCopyWith(Feed value, $Res Function(Feed) _then) = _$FeedCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: _toString) String feedId,@JsonKey(fromJson: _toString) String uid,@JsonKey(fromJson: _toString) String nickname,@JsonKey(fromJson: _toString) String title,@JsonKey(fromJson: _toInt) int level,@JsonKey(fromJson: _toString) String avatarUrl, List<FeedContentBlock> contentBlocks, List<FeedQuiz>? quizzes,@JsonKey(fromJson: _toInt) int countLike,@JsonKey(fromJson: _toInt) int countFunny,@JsonKey(fromJson: _toInt) int countBad,@JsonKey(fromJson: _toInt) int countExpensive,@JsonKey(fromJson: _toInt) int countInteresting,@JsonKey(fromJson: _toInt) int commentCount,@JsonKey(fromJson: _toDateTime) DateTime createdAt,@JsonKey(fromJson: _toDateTime) DateTime updatedAt
});




}
/// @nodoc
class _$FeedCopyWithImpl<$Res>
    implements $FeedCopyWith<$Res> {
  _$FeedCopyWithImpl(this._self, this._then);

  final Feed _self;
  final $Res Function(Feed) _then;

/// Create a copy of Feed
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? feedId = null,Object? uid = null,Object? nickname = null,Object? title = null,Object? level = null,Object? avatarUrl = null,Object? contentBlocks = null,Object? quizzes = freezed,Object? countLike = null,Object? countFunny = null,Object? countBad = null,Object? countExpensive = null,Object? countInteresting = null,Object? commentCount = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
feedId: null == feedId ? _self.feedId : feedId // ignore: cast_nullable_to_non_nullable
as String,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,nickname: null == nickname ? _self.nickname : nickname // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as int,avatarUrl: null == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String,contentBlocks: null == contentBlocks ? _self.contentBlocks : contentBlocks // ignore: cast_nullable_to_non_nullable
as List<FeedContentBlock>,quizzes: freezed == quizzes ? _self.quizzes : quizzes // ignore: cast_nullable_to_non_nullable
as List<FeedQuiz>?,countLike: null == countLike ? _self.countLike : countLike // ignore: cast_nullable_to_non_nullable
as int,countFunny: null == countFunny ? _self.countFunny : countFunny // ignore: cast_nullable_to_non_nullable
as int,countBad: null == countBad ? _self.countBad : countBad // ignore: cast_nullable_to_non_nullable
as int,countExpensive: null == countExpensive ? _self.countExpensive : countExpensive // ignore: cast_nullable_to_non_nullable
as int,countInteresting: null == countInteresting ? _self.countInteresting : countInteresting // ignore: cast_nullable_to_non_nullable
as int,commentCount: null == commentCount ? _self.commentCount : commentCount // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Feed implements Feed {
  const _Feed({@JsonKey(fromJson: _toString) required this.feedId, @JsonKey(fromJson: _toString) required this.uid, @JsonKey(fromJson: _toString) required this.nickname, @JsonKey(fromJson: _toString) required this.title, @JsonKey(fromJson: _toInt) required this.level, @JsonKey(fromJson: _toString) required this.avatarUrl, required final  List<FeedContentBlock> contentBlocks, final  List<FeedQuiz>? quizzes, @JsonKey(fromJson: _toInt) required this.countLike, @JsonKey(fromJson: _toInt) required this.countFunny, @JsonKey(fromJson: _toInt) required this.countBad, @JsonKey(fromJson: _toInt) required this.countExpensive, @JsonKey(fromJson: _toInt) required this.countInteresting, @JsonKey(fromJson: _toInt) required this.commentCount, @JsonKey(fromJson: _toDateTime) required this.createdAt, @JsonKey(fromJson: _toDateTime) required this.updatedAt}): _contentBlocks = contentBlocks,_quizzes = quizzes;
  factory _Feed.fromJson(Map<String, dynamic> json) => _$FeedFromJson(json);

@override@JsonKey(fromJson: _toString) final  String feedId;
@override@JsonKey(fromJson: _toString) final  String uid;
@override@JsonKey(fromJson: _toString) final  String nickname;
@override@JsonKey(fromJson: _toString) final  String title;
@override@JsonKey(fromJson: _toInt) final  int level;
@override@JsonKey(fromJson: _toString) final  String avatarUrl;
 final  List<FeedContentBlock> _contentBlocks;
@override List<FeedContentBlock> get contentBlocks {
  if (_contentBlocks is EqualUnmodifiableListView) return _contentBlocks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_contentBlocks);
}

 final  List<FeedQuiz>? _quizzes;
@override List<FeedQuiz>? get quizzes {
  final value = _quizzes;
  if (value == null) return null;
  if (_quizzes is EqualUnmodifiableListView) return _quizzes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

// ← 여러 개의 퀴즈
@override@JsonKey(fromJson: _toInt) final  int countLike;
@override@JsonKey(fromJson: _toInt) final  int countFunny;
@override@JsonKey(fromJson: _toInt) final  int countBad;
@override@JsonKey(fromJson: _toInt) final  int countExpensive;
@override@JsonKey(fromJson: _toInt) final  int countInteresting;
@override@JsonKey(fromJson: _toInt) final  int commentCount;
@override@JsonKey(fromJson: _toDateTime) final  DateTime createdAt;
@override@JsonKey(fromJson: _toDateTime) final  DateTime updatedAt;

/// Create a copy of Feed
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FeedCopyWith<_Feed> get copyWith => __$FeedCopyWithImpl<_Feed>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FeedToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Feed&&(identical(other.feedId, feedId) || other.feedId == feedId)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.nickname, nickname) || other.nickname == nickname)&&(identical(other.title, title) || other.title == title)&&(identical(other.level, level) || other.level == level)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&const DeepCollectionEquality().equals(other._contentBlocks, _contentBlocks)&&const DeepCollectionEquality().equals(other._quizzes, _quizzes)&&(identical(other.countLike, countLike) || other.countLike == countLike)&&(identical(other.countFunny, countFunny) || other.countFunny == countFunny)&&(identical(other.countBad, countBad) || other.countBad == countBad)&&(identical(other.countExpensive, countExpensive) || other.countExpensive == countExpensive)&&(identical(other.countInteresting, countInteresting) || other.countInteresting == countInteresting)&&(identical(other.commentCount, commentCount) || other.commentCount == commentCount)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,feedId,uid,nickname,title,level,avatarUrl,const DeepCollectionEquality().hash(_contentBlocks),const DeepCollectionEquality().hash(_quizzes),countLike,countFunny,countBad,countExpensive,countInteresting,commentCount,createdAt,updatedAt);

@override
String toString() {
  return 'Feed(feedId: $feedId, uid: $uid, nickname: $nickname, title: $title, level: $level, avatarUrl: $avatarUrl, contentBlocks: $contentBlocks, quizzes: $quizzes, countLike: $countLike, countFunny: $countFunny, countBad: $countBad, countExpensive: $countExpensive, countInteresting: $countInteresting, commentCount: $commentCount, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$FeedCopyWith<$Res> implements $FeedCopyWith<$Res> {
  factory _$FeedCopyWith(_Feed value, $Res Function(_Feed) _then) = __$FeedCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: _toString) String feedId,@JsonKey(fromJson: _toString) String uid,@JsonKey(fromJson: _toString) String nickname,@JsonKey(fromJson: _toString) String title,@JsonKey(fromJson: _toInt) int level,@JsonKey(fromJson: _toString) String avatarUrl, List<FeedContentBlock> contentBlocks, List<FeedQuiz>? quizzes,@JsonKey(fromJson: _toInt) int countLike,@JsonKey(fromJson: _toInt) int countFunny,@JsonKey(fromJson: _toInt) int countBad,@JsonKey(fromJson: _toInt) int countExpensive,@JsonKey(fromJson: _toInt) int countInteresting,@JsonKey(fromJson: _toInt) int commentCount,@JsonKey(fromJson: _toDateTime) DateTime createdAt,@JsonKey(fromJson: _toDateTime) DateTime updatedAt
});




}
/// @nodoc
class __$FeedCopyWithImpl<$Res>
    implements _$FeedCopyWith<$Res> {
  __$FeedCopyWithImpl(this._self, this._then);

  final _Feed _self;
  final $Res Function(_Feed) _then;

/// Create a copy of Feed
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? feedId = null,Object? uid = null,Object? nickname = null,Object? title = null,Object? level = null,Object? avatarUrl = null,Object? contentBlocks = null,Object? quizzes = freezed,Object? countLike = null,Object? countFunny = null,Object? countBad = null,Object? countExpensive = null,Object? countInteresting = null,Object? commentCount = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_Feed(
feedId: null == feedId ? _self.feedId : feedId // ignore: cast_nullable_to_non_nullable
as String,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,nickname: null == nickname ? _self.nickname : nickname // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as int,avatarUrl: null == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String,contentBlocks: null == contentBlocks ? _self._contentBlocks : contentBlocks // ignore: cast_nullable_to_non_nullable
as List<FeedContentBlock>,quizzes: freezed == quizzes ? _self._quizzes : quizzes // ignore: cast_nullable_to_non_nullable
as List<FeedQuiz>?,countLike: null == countLike ? _self.countLike : countLike // ignore: cast_nullable_to_non_nullable
as int,countFunny: null == countFunny ? _self.countFunny : countFunny // ignore: cast_nullable_to_non_nullable
as int,countBad: null == countBad ? _self.countBad : countBad // ignore: cast_nullable_to_non_nullable
as int,countExpensive: null == countExpensive ? _self.countExpensive : countExpensive // ignore: cast_nullable_to_non_nullable
as int,countInteresting: null == countInteresting ? _self.countInteresting : countInteresting // ignore: cast_nullable_to_non_nullable
as int,commentCount: null == commentCount ? _self.commentCount : commentCount // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
