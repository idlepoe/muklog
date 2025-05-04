// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'question.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Question {

@JsonKey(fromJson: _toString) String get questionId;@JsonKey(fromJson: _toString) String get uid;@JsonKey(fromJson: _toString) String get question; List<String> get choices;@JsonKey(fromJson: _toString) String get answer;@JsonKey(fromJson: _toString) String get explanation;@JsonKey(fromJson: _toString) String get imageUrl;@JsonKey(fromJson: _toString) String get userPrice;@JsonKey(fromJson: _toString) String get type;@JsonKey(fromJson: _toString) String get foodName;@JsonKey(fromJson: _toInt) int get likeCount;@JsonKey(fromJson: _toInt) int get playCount;@JsonKey(fromJson: _toDateTime) DateTime get createdAt;@JsonKey(fromJson: _toDateTime) DateTime get updatedAt;// 🔽 추가
@JsonKey(fromJson: _toString) String get creatorNickname;@JsonKey(fromJson: _toString) String get creatorAvatarUrl;
/// Create a copy of Question
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuestionCopyWith<Question> get copyWith => _$QuestionCopyWithImpl<Question>(this as Question, _$identity);

  /// Serializes this Question to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Question&&(identical(other.questionId, questionId) || other.questionId == questionId)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.question, question) || other.question == question)&&const DeepCollectionEquality().equals(other.choices, choices)&&(identical(other.answer, answer) || other.answer == answer)&&(identical(other.explanation, explanation) || other.explanation == explanation)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.userPrice, userPrice) || other.userPrice == userPrice)&&(identical(other.type, type) || other.type == type)&&(identical(other.foodName, foodName) || other.foodName == foodName)&&(identical(other.likeCount, likeCount) || other.likeCount == likeCount)&&(identical(other.playCount, playCount) || other.playCount == playCount)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.creatorNickname, creatorNickname) || other.creatorNickname == creatorNickname)&&(identical(other.creatorAvatarUrl, creatorAvatarUrl) || other.creatorAvatarUrl == creatorAvatarUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,questionId,uid,question,const DeepCollectionEquality().hash(choices),answer,explanation,imageUrl,userPrice,type,foodName,likeCount,playCount,createdAt,updatedAt,creatorNickname,creatorAvatarUrl);

@override
String toString() {
  return 'Question(questionId: $questionId, uid: $uid, question: $question, choices: $choices, answer: $answer, explanation: $explanation, imageUrl: $imageUrl, userPrice: $userPrice, type: $type, foodName: $foodName, likeCount: $likeCount, playCount: $playCount, createdAt: $createdAt, updatedAt: $updatedAt, creatorNickname: $creatorNickname, creatorAvatarUrl: $creatorAvatarUrl)';
}


}

/// @nodoc
abstract mixin class $QuestionCopyWith<$Res>  {
  factory $QuestionCopyWith(Question value, $Res Function(Question) _then) = _$QuestionCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: _toString) String questionId,@JsonKey(fromJson: _toString) String uid,@JsonKey(fromJson: _toString) String question, List<String> choices,@JsonKey(fromJson: _toString) String answer,@JsonKey(fromJson: _toString) String explanation,@JsonKey(fromJson: _toString) String imageUrl,@JsonKey(fromJson: _toString) String userPrice,@JsonKey(fromJson: _toString) String type,@JsonKey(fromJson: _toString) String foodName,@JsonKey(fromJson: _toInt) int likeCount,@JsonKey(fromJson: _toInt) int playCount,@JsonKey(fromJson: _toDateTime) DateTime createdAt,@JsonKey(fromJson: _toDateTime) DateTime updatedAt,@JsonKey(fromJson: _toString) String creatorNickname,@JsonKey(fromJson: _toString) String creatorAvatarUrl
});




}
/// @nodoc
class _$QuestionCopyWithImpl<$Res>
    implements $QuestionCopyWith<$Res> {
  _$QuestionCopyWithImpl(this._self, this._then);

  final Question _self;
  final $Res Function(Question) _then;

/// Create a copy of Question
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? questionId = null,Object? uid = null,Object? question = null,Object? choices = null,Object? answer = null,Object? explanation = null,Object? imageUrl = null,Object? userPrice = null,Object? type = null,Object? foodName = null,Object? likeCount = null,Object? playCount = null,Object? createdAt = null,Object? updatedAt = null,Object? creatorNickname = null,Object? creatorAvatarUrl = null,}) {
  return _then(_self.copyWith(
questionId: null == questionId ? _self.questionId : questionId // ignore: cast_nullable_to_non_nullable
as String,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,question: null == question ? _self.question : question // ignore: cast_nullable_to_non_nullable
as String,choices: null == choices ? _self.choices : choices // ignore: cast_nullable_to_non_nullable
as List<String>,answer: null == answer ? _self.answer : answer // ignore: cast_nullable_to_non_nullable
as String,explanation: null == explanation ? _self.explanation : explanation // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,userPrice: null == userPrice ? _self.userPrice : userPrice // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,foodName: null == foodName ? _self.foodName : foodName // ignore: cast_nullable_to_non_nullable
as String,likeCount: null == likeCount ? _self.likeCount : likeCount // ignore: cast_nullable_to_non_nullable
as int,playCount: null == playCount ? _self.playCount : playCount // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,creatorNickname: null == creatorNickname ? _self.creatorNickname : creatorNickname // ignore: cast_nullable_to_non_nullable
as String,creatorAvatarUrl: null == creatorAvatarUrl ? _self.creatorAvatarUrl : creatorAvatarUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Question implements Question {
  const _Question({@JsonKey(fromJson: _toString) required this.questionId, @JsonKey(fromJson: _toString) required this.uid, @JsonKey(fromJson: _toString) required this.question, required final  List<String> choices, @JsonKey(fromJson: _toString) required this.answer, @JsonKey(fromJson: _toString) required this.explanation, @JsonKey(fromJson: _toString) required this.imageUrl, @JsonKey(fromJson: _toString) required this.userPrice, @JsonKey(fromJson: _toString) required this.type, @JsonKey(fromJson: _toString) required this.foodName, @JsonKey(fromJson: _toInt) required this.likeCount, @JsonKey(fromJson: _toInt) required this.playCount, @JsonKey(fromJson: _toDateTime) required this.createdAt, @JsonKey(fromJson: _toDateTime) required this.updatedAt, @JsonKey(fromJson: _toString) required this.creatorNickname, @JsonKey(fromJson: _toString) required this.creatorAvatarUrl}): _choices = choices;
  factory _Question.fromJson(Map<String, dynamic> json) => _$QuestionFromJson(json);

@override@JsonKey(fromJson: _toString) final  String questionId;
@override@JsonKey(fromJson: _toString) final  String uid;
@override@JsonKey(fromJson: _toString) final  String question;
 final  List<String> _choices;
@override List<String> get choices {
  if (_choices is EqualUnmodifiableListView) return _choices;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_choices);
}

@override@JsonKey(fromJson: _toString) final  String answer;
@override@JsonKey(fromJson: _toString) final  String explanation;
@override@JsonKey(fromJson: _toString) final  String imageUrl;
@override@JsonKey(fromJson: _toString) final  String userPrice;
@override@JsonKey(fromJson: _toString) final  String type;
@override@JsonKey(fromJson: _toString) final  String foodName;
@override@JsonKey(fromJson: _toInt) final  int likeCount;
@override@JsonKey(fromJson: _toInt) final  int playCount;
@override@JsonKey(fromJson: _toDateTime) final  DateTime createdAt;
@override@JsonKey(fromJson: _toDateTime) final  DateTime updatedAt;
// 🔽 추가
@override@JsonKey(fromJson: _toString) final  String creatorNickname;
@override@JsonKey(fromJson: _toString) final  String creatorAvatarUrl;

/// Create a copy of Question
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuestionCopyWith<_Question> get copyWith => __$QuestionCopyWithImpl<_Question>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QuestionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Question&&(identical(other.questionId, questionId) || other.questionId == questionId)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.question, question) || other.question == question)&&const DeepCollectionEquality().equals(other._choices, _choices)&&(identical(other.answer, answer) || other.answer == answer)&&(identical(other.explanation, explanation) || other.explanation == explanation)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.userPrice, userPrice) || other.userPrice == userPrice)&&(identical(other.type, type) || other.type == type)&&(identical(other.foodName, foodName) || other.foodName == foodName)&&(identical(other.likeCount, likeCount) || other.likeCount == likeCount)&&(identical(other.playCount, playCount) || other.playCount == playCount)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.creatorNickname, creatorNickname) || other.creatorNickname == creatorNickname)&&(identical(other.creatorAvatarUrl, creatorAvatarUrl) || other.creatorAvatarUrl == creatorAvatarUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,questionId,uid,question,const DeepCollectionEquality().hash(_choices),answer,explanation,imageUrl,userPrice,type,foodName,likeCount,playCount,createdAt,updatedAt,creatorNickname,creatorAvatarUrl);

@override
String toString() {
  return 'Question(questionId: $questionId, uid: $uid, question: $question, choices: $choices, answer: $answer, explanation: $explanation, imageUrl: $imageUrl, userPrice: $userPrice, type: $type, foodName: $foodName, likeCount: $likeCount, playCount: $playCount, createdAt: $createdAt, updatedAt: $updatedAt, creatorNickname: $creatorNickname, creatorAvatarUrl: $creatorAvatarUrl)';
}


}

/// @nodoc
abstract mixin class _$QuestionCopyWith<$Res> implements $QuestionCopyWith<$Res> {
  factory _$QuestionCopyWith(_Question value, $Res Function(_Question) _then) = __$QuestionCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: _toString) String questionId,@JsonKey(fromJson: _toString) String uid,@JsonKey(fromJson: _toString) String question, List<String> choices,@JsonKey(fromJson: _toString) String answer,@JsonKey(fromJson: _toString) String explanation,@JsonKey(fromJson: _toString) String imageUrl,@JsonKey(fromJson: _toString) String userPrice,@JsonKey(fromJson: _toString) String type,@JsonKey(fromJson: _toString) String foodName,@JsonKey(fromJson: _toInt) int likeCount,@JsonKey(fromJson: _toInt) int playCount,@JsonKey(fromJson: _toDateTime) DateTime createdAt,@JsonKey(fromJson: _toDateTime) DateTime updatedAt,@JsonKey(fromJson: _toString) String creatorNickname,@JsonKey(fromJson: _toString) String creatorAvatarUrl
});




}
/// @nodoc
class __$QuestionCopyWithImpl<$Res>
    implements _$QuestionCopyWith<$Res> {
  __$QuestionCopyWithImpl(this._self, this._then);

  final _Question _self;
  final $Res Function(_Question) _then;

/// Create a copy of Question
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? questionId = null,Object? uid = null,Object? question = null,Object? choices = null,Object? answer = null,Object? explanation = null,Object? imageUrl = null,Object? userPrice = null,Object? type = null,Object? foodName = null,Object? likeCount = null,Object? playCount = null,Object? createdAt = null,Object? updatedAt = null,Object? creatorNickname = null,Object? creatorAvatarUrl = null,}) {
  return _then(_Question(
questionId: null == questionId ? _self.questionId : questionId // ignore: cast_nullable_to_non_nullable
as String,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,question: null == question ? _self.question : question // ignore: cast_nullable_to_non_nullable
as String,choices: null == choices ? _self._choices : choices // ignore: cast_nullable_to_non_nullable
as List<String>,answer: null == answer ? _self.answer : answer // ignore: cast_nullable_to_non_nullable
as String,explanation: null == explanation ? _self.explanation : explanation // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,userPrice: null == userPrice ? _self.userPrice : userPrice // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,foodName: null == foodName ? _self.foodName : foodName // ignore: cast_nullable_to_non_nullable
as String,likeCount: null == likeCount ? _self.likeCount : likeCount // ignore: cast_nullable_to_non_nullable
as int,playCount: null == playCount ? _self.playCount : playCount // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,creatorNickname: null == creatorNickname ? _self.creatorNickname : creatorNickname // ignore: cast_nullable_to_non_nullable
as String,creatorAvatarUrl: null == creatorAvatarUrl ? _self.creatorAvatarUrl : creatorAvatarUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
