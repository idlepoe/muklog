// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feed_quiz.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FeedQuiz {

@JsonKey(fromJson: _toString) String get imageUrl;@JsonKey(fromJson: _toString) String get question; List<String> get choices;@JsonKey(fromJson: _toString) String get answer;@JsonKey(fromJson: _toInt) int get rewardPoint;
/// Create a copy of FeedQuiz
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FeedQuizCopyWith<FeedQuiz> get copyWith => _$FeedQuizCopyWithImpl<FeedQuiz>(this as FeedQuiz, _$identity);

  /// Serializes this FeedQuiz to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FeedQuiz&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.question, question) || other.question == question)&&const DeepCollectionEquality().equals(other.choices, choices)&&(identical(other.answer, answer) || other.answer == answer)&&(identical(other.rewardPoint, rewardPoint) || other.rewardPoint == rewardPoint));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,imageUrl,question,const DeepCollectionEquality().hash(choices),answer,rewardPoint);

@override
String toString() {
  return 'FeedQuiz(imageUrl: $imageUrl, question: $question, choices: $choices, answer: $answer, rewardPoint: $rewardPoint)';
}


}

/// @nodoc
abstract mixin class $FeedQuizCopyWith<$Res>  {
  factory $FeedQuizCopyWith(FeedQuiz value, $Res Function(FeedQuiz) _then) = _$FeedQuizCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: _toString) String imageUrl,@JsonKey(fromJson: _toString) String question, List<String> choices,@JsonKey(fromJson: _toString) String answer,@JsonKey(fromJson: _toInt) int rewardPoint
});




}
/// @nodoc
class _$FeedQuizCopyWithImpl<$Res>
    implements $FeedQuizCopyWith<$Res> {
  _$FeedQuizCopyWithImpl(this._self, this._then);

  final FeedQuiz _self;
  final $Res Function(FeedQuiz) _then;

/// Create a copy of FeedQuiz
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? imageUrl = null,Object? question = null,Object? choices = null,Object? answer = null,Object? rewardPoint = null,}) {
  return _then(_self.copyWith(
imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,question: null == question ? _self.question : question // ignore: cast_nullable_to_non_nullable
as String,choices: null == choices ? _self.choices : choices // ignore: cast_nullable_to_non_nullable
as List<String>,answer: null == answer ? _self.answer : answer // ignore: cast_nullable_to_non_nullable
as String,rewardPoint: null == rewardPoint ? _self.rewardPoint : rewardPoint // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _FeedQuiz implements FeedQuiz {
  const _FeedQuiz({@JsonKey(fromJson: _toString) required this.imageUrl, @JsonKey(fromJson: _toString) required this.question, required final  List<String> choices, @JsonKey(fromJson: _toString) required this.answer, @JsonKey(fromJson: _toInt) required this.rewardPoint}): _choices = choices;
  factory _FeedQuiz.fromJson(Map<String, dynamic> json) => _$FeedQuizFromJson(json);

@override@JsonKey(fromJson: _toString) final  String imageUrl;
@override@JsonKey(fromJson: _toString) final  String question;
 final  List<String> _choices;
@override List<String> get choices {
  if (_choices is EqualUnmodifiableListView) return _choices;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_choices);
}

@override@JsonKey(fromJson: _toString) final  String answer;
@override@JsonKey(fromJson: _toInt) final  int rewardPoint;

/// Create a copy of FeedQuiz
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FeedQuizCopyWith<_FeedQuiz> get copyWith => __$FeedQuizCopyWithImpl<_FeedQuiz>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FeedQuizToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FeedQuiz&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.question, question) || other.question == question)&&const DeepCollectionEquality().equals(other._choices, _choices)&&(identical(other.answer, answer) || other.answer == answer)&&(identical(other.rewardPoint, rewardPoint) || other.rewardPoint == rewardPoint));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,imageUrl,question,const DeepCollectionEquality().hash(_choices),answer,rewardPoint);

@override
String toString() {
  return 'FeedQuiz(imageUrl: $imageUrl, question: $question, choices: $choices, answer: $answer, rewardPoint: $rewardPoint)';
}


}

/// @nodoc
abstract mixin class _$FeedQuizCopyWith<$Res> implements $FeedQuizCopyWith<$Res> {
  factory _$FeedQuizCopyWith(_FeedQuiz value, $Res Function(_FeedQuiz) _then) = __$FeedQuizCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: _toString) String imageUrl,@JsonKey(fromJson: _toString) String question, List<String> choices,@JsonKey(fromJson: _toString) String answer,@JsonKey(fromJson: _toInt) int rewardPoint
});




}
/// @nodoc
class __$FeedQuizCopyWithImpl<$Res>
    implements _$FeedQuizCopyWith<$Res> {
  __$FeedQuizCopyWithImpl(this._self, this._then);

  final _FeedQuiz _self;
  final $Res Function(_FeedQuiz) _then;

/// Create a copy of FeedQuiz
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? imageUrl = null,Object? question = null,Object? choices = null,Object? answer = null,Object? rewardPoint = null,}) {
  return _then(_FeedQuiz(
imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,question: null == question ? _self.question : question // ignore: cast_nullable_to_non_nullable
as String,choices: null == choices ? _self._choices : choices // ignore: cast_nullable_to_non_nullable
as List<String>,answer: null == answer ? _self.answer : answer // ignore: cast_nullable_to_non_nullable
as String,rewardPoint: null == rewardPoint ? _self.rewardPoint : rewardPoint // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
