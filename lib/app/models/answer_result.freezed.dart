// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'answer_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AnswerResult {

@JsonKey(fromJson: _toBool) bool get isCorrect;@JsonKey(fromJson: _toInt) int get correctAnswerIndex;@JsonKey(fromJson: _toInt) int get earnedPoint;@JsonKey(fromJson: _toString) String? get comment;
/// Create a copy of AnswerResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AnswerResultCopyWith<AnswerResult> get copyWith => _$AnswerResultCopyWithImpl<AnswerResult>(this as AnswerResult, _$identity);

  /// Serializes this AnswerResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnswerResult&&(identical(other.isCorrect, isCorrect) || other.isCorrect == isCorrect)&&(identical(other.correctAnswerIndex, correctAnswerIndex) || other.correctAnswerIndex == correctAnswerIndex)&&(identical(other.earnedPoint, earnedPoint) || other.earnedPoint == earnedPoint)&&(identical(other.comment, comment) || other.comment == comment));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isCorrect,correctAnswerIndex,earnedPoint,comment);

@override
String toString() {
  return 'AnswerResult(isCorrect: $isCorrect, correctAnswerIndex: $correctAnswerIndex, earnedPoint: $earnedPoint, comment: $comment)';
}


}

/// @nodoc
abstract mixin class $AnswerResultCopyWith<$Res>  {
  factory $AnswerResultCopyWith(AnswerResult value, $Res Function(AnswerResult) _then) = _$AnswerResultCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: _toBool) bool isCorrect,@JsonKey(fromJson: _toInt) int correctAnswerIndex,@JsonKey(fromJson: _toInt) int earnedPoint,@JsonKey(fromJson: _toString) String? comment
});




}
/// @nodoc
class _$AnswerResultCopyWithImpl<$Res>
    implements $AnswerResultCopyWith<$Res> {
  _$AnswerResultCopyWithImpl(this._self, this._then);

  final AnswerResult _self;
  final $Res Function(AnswerResult) _then;

/// Create a copy of AnswerResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isCorrect = null,Object? correctAnswerIndex = null,Object? earnedPoint = null,Object? comment = freezed,}) {
  return _then(_self.copyWith(
isCorrect: null == isCorrect ? _self.isCorrect : isCorrect // ignore: cast_nullable_to_non_nullable
as bool,correctAnswerIndex: null == correctAnswerIndex ? _self.correctAnswerIndex : correctAnswerIndex // ignore: cast_nullable_to_non_nullable
as int,earnedPoint: null == earnedPoint ? _self.earnedPoint : earnedPoint // ignore: cast_nullable_to_non_nullable
as int,comment: freezed == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _AnswerResult implements AnswerResult {
  const _AnswerResult({@JsonKey(fromJson: _toBool) required this.isCorrect, @JsonKey(fromJson: _toInt) required this.correctAnswerIndex, @JsonKey(fromJson: _toInt) required this.earnedPoint, @JsonKey(fromJson: _toString) this.comment});
  factory _AnswerResult.fromJson(Map<String, dynamic> json) => _$AnswerResultFromJson(json);

@override@JsonKey(fromJson: _toBool) final  bool isCorrect;
@override@JsonKey(fromJson: _toInt) final  int correctAnswerIndex;
@override@JsonKey(fromJson: _toInt) final  int earnedPoint;
@override@JsonKey(fromJson: _toString) final  String? comment;

/// Create a copy of AnswerResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AnswerResultCopyWith<_AnswerResult> get copyWith => __$AnswerResultCopyWithImpl<_AnswerResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AnswerResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AnswerResult&&(identical(other.isCorrect, isCorrect) || other.isCorrect == isCorrect)&&(identical(other.correctAnswerIndex, correctAnswerIndex) || other.correctAnswerIndex == correctAnswerIndex)&&(identical(other.earnedPoint, earnedPoint) || other.earnedPoint == earnedPoint)&&(identical(other.comment, comment) || other.comment == comment));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isCorrect,correctAnswerIndex,earnedPoint,comment);

@override
String toString() {
  return 'AnswerResult(isCorrect: $isCorrect, correctAnswerIndex: $correctAnswerIndex, earnedPoint: $earnedPoint, comment: $comment)';
}


}

/// @nodoc
abstract mixin class _$AnswerResultCopyWith<$Res> implements $AnswerResultCopyWith<$Res> {
  factory _$AnswerResultCopyWith(_AnswerResult value, $Res Function(_AnswerResult) _then) = __$AnswerResultCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: _toBool) bool isCorrect,@JsonKey(fromJson: _toInt) int correctAnswerIndex,@JsonKey(fromJson: _toInt) int earnedPoint,@JsonKey(fromJson: _toString) String? comment
});




}
/// @nodoc
class __$AnswerResultCopyWithImpl<$Res>
    implements _$AnswerResultCopyWith<$Res> {
  __$AnswerResultCopyWithImpl(this._self, this._then);

  final _AnswerResult _self;
  final $Res Function(_AnswerResult) _then;

/// Create a copy of AnswerResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isCorrect = null,Object? correctAnswerIndex = null,Object? earnedPoint = null,Object? comment = freezed,}) {
  return _then(_AnswerResult(
isCorrect: null == isCorrect ? _self.isCorrect : isCorrect // ignore: cast_nullable_to_non_nullable
as bool,correctAnswerIndex: null == correctAnswerIndex ? _self.correctAnswerIndex : correctAnswerIndex // ignore: cast_nullable_to_non_nullable
as int,earnedPoint: null == earnedPoint ? _self.earnedPoint : earnedPoint // ignore: cast_nullable_to_non_nullable
as int,comment: freezed == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
