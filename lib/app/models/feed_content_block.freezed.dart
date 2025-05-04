// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feed_content_block.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
FeedContentBlock _$FeedContentBlockFromJson(
  Map<String, dynamic> json
) {
        switch (json['runtimeType']) {
                  case 'image':
          return FeedContentImage.fromJson(
            json
          );
                case 'text':
          return FeedContentText.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'runtimeType',
  'FeedContentBlock',
  'Invalid union type "${json['runtimeType']}"!'
);
        }
      
}

/// @nodoc
mixin _$FeedContentBlock {

@JsonKey(fromJson: _toString) String get value;
/// Create a copy of FeedContentBlock
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FeedContentBlockCopyWith<FeedContentBlock> get copyWith => _$FeedContentBlockCopyWithImpl<FeedContentBlock>(this as FeedContentBlock, _$identity);

  /// Serializes this FeedContentBlock to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FeedContentBlock&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'FeedContentBlock(value: $value)';
}


}

/// @nodoc
abstract mixin class $FeedContentBlockCopyWith<$Res>  {
  factory $FeedContentBlockCopyWith(FeedContentBlock value, $Res Function(FeedContentBlock) _then) = _$FeedContentBlockCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: _toString) String value
});




}
/// @nodoc
class _$FeedContentBlockCopyWithImpl<$Res>
    implements $FeedContentBlockCopyWith<$Res> {
  _$FeedContentBlockCopyWithImpl(this._self, this._then);

  final FeedContentBlock _self;
  final $Res Function(FeedContentBlock) _then;

/// Create a copy of FeedContentBlock
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? value = null,}) {
  return _then(_self.copyWith(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class FeedContentImage implements FeedContentBlock {
  const FeedContentImage({@JsonKey(fromJson: _toString) required this.value, final  String? $type}): $type = $type ?? 'image';
  factory FeedContentImage.fromJson(Map<String, dynamic> json) => _$FeedContentImageFromJson(json);

@override@JsonKey(fromJson: _toString) final  String value;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of FeedContentBlock
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FeedContentImageCopyWith<FeedContentImage> get copyWith => _$FeedContentImageCopyWithImpl<FeedContentImage>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FeedContentImageToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FeedContentImage&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'FeedContentBlock.image(value: $value)';
}


}

/// @nodoc
abstract mixin class $FeedContentImageCopyWith<$Res> implements $FeedContentBlockCopyWith<$Res> {
  factory $FeedContentImageCopyWith(FeedContentImage value, $Res Function(FeedContentImage) _then) = _$FeedContentImageCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: _toString) String value
});




}
/// @nodoc
class _$FeedContentImageCopyWithImpl<$Res>
    implements $FeedContentImageCopyWith<$Res> {
  _$FeedContentImageCopyWithImpl(this._self, this._then);

  final FeedContentImage _self;
  final $Res Function(FeedContentImage) _then;

/// Create a copy of FeedContentBlock
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(FeedContentImage(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
@JsonSerializable()

class FeedContentText implements FeedContentBlock {
  const FeedContentText({@JsonKey(fromJson: _toString) required this.value, final  String? $type}): $type = $type ?? 'text';
  factory FeedContentText.fromJson(Map<String, dynamic> json) => _$FeedContentTextFromJson(json);

@override@JsonKey(fromJson: _toString) final  String value;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of FeedContentBlock
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FeedContentTextCopyWith<FeedContentText> get copyWith => _$FeedContentTextCopyWithImpl<FeedContentText>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FeedContentTextToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FeedContentText&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'FeedContentBlock.text(value: $value)';
}


}

/// @nodoc
abstract mixin class $FeedContentTextCopyWith<$Res> implements $FeedContentBlockCopyWith<$Res> {
  factory $FeedContentTextCopyWith(FeedContentText value, $Res Function(FeedContentText) _then) = _$FeedContentTextCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: _toString) String value
});




}
/// @nodoc
class _$FeedContentTextCopyWithImpl<$Res>
    implements $FeedContentTextCopyWith<$Res> {
  _$FeedContentTextCopyWithImpl(this._self, this._then);

  final FeedContentText _self;
  final $Res Function(FeedContentText) _then;

/// Create a copy of FeedContentBlock
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(FeedContentText(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
