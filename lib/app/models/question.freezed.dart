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

@JsonKey(fromJson: _toString) String get id;@JsonKey(fromJson: _toString) String get imageUrl;@JsonKey(fromJson: _toString) String get description; List<String> get choices;@JsonKey(fromJson: _toInt) int get answerIndex;@JsonKey(fromJson: _toString) String get authorUid;@JsonKey(fromJson: _toString) String get authorNickname;@JsonKey(fromJson: _toDateTime) DateTime get createdAt;
/// Create a copy of Question
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuestionCopyWith<Question> get copyWith => _$QuestionCopyWithImpl<Question>(this as Question, _$identity);

  /// Serializes this Question to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Question&&(identical(other.id, id) || other.id == id)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.choices, choices)&&(identical(other.answerIndex, answerIndex) || other.answerIndex == answerIndex)&&(identical(other.authorUid, authorUid) || other.authorUid == authorUid)&&(identical(other.authorNickname, authorNickname) || other.authorNickname == authorNickname)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,imageUrl,description,const DeepCollectionEquality().hash(choices),answerIndex,authorUid,authorNickname,createdAt);

@override
String toString() {
  return 'Question(id: $id, imageUrl: $imageUrl, description: $description, choices: $choices, answerIndex: $answerIndex, authorUid: $authorUid, authorNickname: $authorNickname, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $QuestionCopyWith<$Res>  {
  factory $QuestionCopyWith(Question value, $Res Function(Question) _then) = _$QuestionCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: _toString) String id,@JsonKey(fromJson: _toString) String imageUrl,@JsonKey(fromJson: _toString) String description, List<String> choices,@JsonKey(fromJson: _toInt) int answerIndex,@JsonKey(fromJson: _toString) String authorUid,@JsonKey(fromJson: _toString) String authorNickname,@JsonKey(fromJson: _toDateTime) DateTime createdAt
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? imageUrl = null,Object? description = null,Object? choices = null,Object? answerIndex = null,Object? authorUid = null,Object? authorNickname = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,choices: null == choices ? _self.choices : choices // ignore: cast_nullable_to_non_nullable
as List<String>,answerIndex: null == answerIndex ? _self.answerIndex : answerIndex // ignore: cast_nullable_to_non_nullable
as int,authorUid: null == authorUid ? _self.authorUid : authorUid // ignore: cast_nullable_to_non_nullable
as String,authorNickname: null == authorNickname ? _self.authorNickname : authorNickname // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Question implements Question {
  const _Question({@JsonKey(fromJson: _toString) required this.id, @JsonKey(fromJson: _toString) required this.imageUrl, @JsonKey(fromJson: _toString) required this.description, required final  List<String> choices, @JsonKey(fromJson: _toInt) required this.answerIndex, @JsonKey(fromJson: _toString) required this.authorUid, @JsonKey(fromJson: _toString) required this.authorNickname, @JsonKey(fromJson: _toDateTime) required this.createdAt}): _choices = choices;
  factory _Question.fromJson(Map<String, dynamic> json) => _$QuestionFromJson(json);

@override@JsonKey(fromJson: _toString) final  String id;
@override@JsonKey(fromJson: _toString) final  String imageUrl;
@override@JsonKey(fromJson: _toString) final  String description;
 final  List<String> _choices;
@override List<String> get choices {
  if (_choices is EqualUnmodifiableListView) return _choices;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_choices);
}

@override@JsonKey(fromJson: _toInt) final  int answerIndex;
@override@JsonKey(fromJson: _toString) final  String authorUid;
@override@JsonKey(fromJson: _toString) final  String authorNickname;
@override@JsonKey(fromJson: _toDateTime) final  DateTime createdAt;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Question&&(identical(other.id, id) || other.id == id)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._choices, _choices)&&(identical(other.answerIndex, answerIndex) || other.answerIndex == answerIndex)&&(identical(other.authorUid, authorUid) || other.authorUid == authorUid)&&(identical(other.authorNickname, authorNickname) || other.authorNickname == authorNickname)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,imageUrl,description,const DeepCollectionEquality().hash(_choices),answerIndex,authorUid,authorNickname,createdAt);

@override
String toString() {
  return 'Question(id: $id, imageUrl: $imageUrl, description: $description, choices: $choices, answerIndex: $answerIndex, authorUid: $authorUid, authorNickname: $authorNickname, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$QuestionCopyWith<$Res> implements $QuestionCopyWith<$Res> {
  factory _$QuestionCopyWith(_Question value, $Res Function(_Question) _then) = __$QuestionCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: _toString) String id,@JsonKey(fromJson: _toString) String imageUrl,@JsonKey(fromJson: _toString) String description, List<String> choices,@JsonKey(fromJson: _toInt) int answerIndex,@JsonKey(fromJson: _toString) String authorUid,@JsonKey(fromJson: _toString) String authorNickname,@JsonKey(fromJson: _toDateTime) DateTime createdAt
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? imageUrl = null,Object? description = null,Object? choices = null,Object? answerIndex = null,Object? authorUid = null,Object? authorNickname = null,Object? createdAt = null,}) {
  return _then(_Question(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,choices: null == choices ? _self._choices : choices // ignore: cast_nullable_to_non_nullable
as List<String>,answerIndex: null == answerIndex ? _self.answerIndex : answerIndex // ignore: cast_nullable_to_non_nullable
as int,authorUid: null == authorUid ? _self.authorUid : authorUid // ignore: cast_nullable_to_non_nullable
as String,authorNickname: null == authorNickname ? _self.authorNickname : authorNickname // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
