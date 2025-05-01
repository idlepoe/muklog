// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'generated_question.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GeneratedQuestion {

@JsonKey(fromJson: _toString) String get question; List<String> get choices;@JsonKey(fromJson: _toString) String get answer;@JsonKey(fromJson: _toString) String get explanation;@JsonKey(fromJson: _toString) String get imageUrl;@JsonKey(fromJson: _toString) String get userPrice; String get type;// 'objective' | 'ox' 등
 String? get foodName;
/// Create a copy of GeneratedQuestion
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GeneratedQuestionCopyWith<GeneratedQuestion> get copyWith => _$GeneratedQuestionCopyWithImpl<GeneratedQuestion>(this as GeneratedQuestion, _$identity);

  /// Serializes this GeneratedQuestion to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GeneratedQuestion&&(identical(other.question, question) || other.question == question)&&const DeepCollectionEquality().equals(other.choices, choices)&&(identical(other.answer, answer) || other.answer == answer)&&(identical(other.explanation, explanation) || other.explanation == explanation)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.userPrice, userPrice) || other.userPrice == userPrice)&&(identical(other.type, type) || other.type == type)&&(identical(other.foodName, foodName) || other.foodName == foodName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,question,const DeepCollectionEquality().hash(choices),answer,explanation,imageUrl,userPrice,type,foodName);

@override
String toString() {
  return 'GeneratedQuestion(question: $question, choices: $choices, answer: $answer, explanation: $explanation, imageUrl: $imageUrl, userPrice: $userPrice, type: $type, foodName: $foodName)';
}


}

/// @nodoc
abstract mixin class $GeneratedQuestionCopyWith<$Res>  {
  factory $GeneratedQuestionCopyWith(GeneratedQuestion value, $Res Function(GeneratedQuestion) _then) = _$GeneratedQuestionCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: _toString) String question, List<String> choices,@JsonKey(fromJson: _toString) String answer,@JsonKey(fromJson: _toString) String explanation,@JsonKey(fromJson: _toString) String imageUrl,@JsonKey(fromJson: _toString) String userPrice, String type, String? foodName
});




}
/// @nodoc
class _$GeneratedQuestionCopyWithImpl<$Res>
    implements $GeneratedQuestionCopyWith<$Res> {
  _$GeneratedQuestionCopyWithImpl(this._self, this._then);

  final GeneratedQuestion _self;
  final $Res Function(GeneratedQuestion) _then;

/// Create a copy of GeneratedQuestion
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? question = null,Object? choices = null,Object? answer = null,Object? explanation = null,Object? imageUrl = null,Object? userPrice = null,Object? type = null,Object? foodName = freezed,}) {
  return _then(_self.copyWith(
question: null == question ? _self.question : question // ignore: cast_nullable_to_non_nullable
as String,choices: null == choices ? _self.choices : choices // ignore: cast_nullable_to_non_nullable
as List<String>,answer: null == answer ? _self.answer : answer // ignore: cast_nullable_to_non_nullable
as String,explanation: null == explanation ? _self.explanation : explanation // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,userPrice: null == userPrice ? _self.userPrice : userPrice // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,foodName: freezed == foodName ? _self.foodName : foodName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _GeneratedQuestion implements GeneratedQuestion {
  const _GeneratedQuestion({@JsonKey(fromJson: _toString) required this.question, required final  List<String> choices, @JsonKey(fromJson: _toString) required this.answer, @JsonKey(fromJson: _toString) required this.explanation, @JsonKey(fromJson: _toString) required this.imageUrl, @JsonKey(fromJson: _toString) required this.userPrice, this.type = 'objective', this.foodName}): _choices = choices;
  factory _GeneratedQuestion.fromJson(Map<String, dynamic> json) => _$GeneratedQuestionFromJson(json);

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
@override@JsonKey() final  String type;
// 'objective' | 'ox' 등
@override final  String? foodName;

/// Create a copy of GeneratedQuestion
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GeneratedQuestionCopyWith<_GeneratedQuestion> get copyWith => __$GeneratedQuestionCopyWithImpl<_GeneratedQuestion>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GeneratedQuestionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GeneratedQuestion&&(identical(other.question, question) || other.question == question)&&const DeepCollectionEquality().equals(other._choices, _choices)&&(identical(other.answer, answer) || other.answer == answer)&&(identical(other.explanation, explanation) || other.explanation == explanation)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.userPrice, userPrice) || other.userPrice == userPrice)&&(identical(other.type, type) || other.type == type)&&(identical(other.foodName, foodName) || other.foodName == foodName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,question,const DeepCollectionEquality().hash(_choices),answer,explanation,imageUrl,userPrice,type,foodName);

@override
String toString() {
  return 'GeneratedQuestion(question: $question, choices: $choices, answer: $answer, explanation: $explanation, imageUrl: $imageUrl, userPrice: $userPrice, type: $type, foodName: $foodName)';
}


}

/// @nodoc
abstract mixin class _$GeneratedQuestionCopyWith<$Res> implements $GeneratedQuestionCopyWith<$Res> {
  factory _$GeneratedQuestionCopyWith(_GeneratedQuestion value, $Res Function(_GeneratedQuestion) _then) = __$GeneratedQuestionCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: _toString) String question, List<String> choices,@JsonKey(fromJson: _toString) String answer,@JsonKey(fromJson: _toString) String explanation,@JsonKey(fromJson: _toString) String imageUrl,@JsonKey(fromJson: _toString) String userPrice, String type, String? foodName
});




}
/// @nodoc
class __$GeneratedQuestionCopyWithImpl<$Res>
    implements _$GeneratedQuestionCopyWith<$Res> {
  __$GeneratedQuestionCopyWithImpl(this._self, this._then);

  final _GeneratedQuestion _self;
  final $Res Function(_GeneratedQuestion) _then;

/// Create a copy of GeneratedQuestion
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? question = null,Object? choices = null,Object? answer = null,Object? explanation = null,Object? imageUrl = null,Object? userPrice = null,Object? type = null,Object? foodName = freezed,}) {
  return _then(_GeneratedQuestion(
question: null == question ? _self.question : question // ignore: cast_nullable_to_non_nullable
as String,choices: null == choices ? _self._choices : choices // ignore: cast_nullable_to_non_nullable
as List<String>,answer: null == answer ? _self.answer : answer // ignore: cast_nullable_to_non_nullable
as String,explanation: null == explanation ? _self.explanation : explanation // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,userPrice: null == userPrice ? _self.userPrice : userPrice // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,foodName: freezed == foodName ? _self.foodName : foodName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
