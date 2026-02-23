// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SignModel {

 String get id; String? get letter; String? get word;@JsonKey(name: 'image_url') String get imageUrl;@JsonKey(name: 'category_id') String get categoryId;
/// Create a copy of SignModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignModelCopyWith<SignModel> get copyWith => _$SignModelCopyWithImpl<SignModel>(this as SignModel, _$identity);

  /// Serializes this SignModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignModel&&(identical(other.id, id) || other.id == id)&&(identical(other.letter, letter) || other.letter == letter)&&(identical(other.word, word) || other.word == word)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,letter,word,imageUrl,categoryId);

@override
String toString() {
  return 'SignModel(id: $id, letter: $letter, word: $word, imageUrl: $imageUrl, categoryId: $categoryId)';
}


}

/// @nodoc
abstract mixin class $SignModelCopyWith<$Res>  {
  factory $SignModelCopyWith(SignModel value, $Res Function(SignModel) _then) = _$SignModelCopyWithImpl;
@useResult
$Res call({
 String id, String? letter, String? word,@JsonKey(name: 'image_url') String imageUrl,@JsonKey(name: 'category_id') String categoryId
});




}
/// @nodoc
class _$SignModelCopyWithImpl<$Res>
    implements $SignModelCopyWith<$Res> {
  _$SignModelCopyWithImpl(this._self, this._then);

  final SignModel _self;
  final $Res Function(SignModel) _then;

/// Create a copy of SignModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? letter = freezed,Object? word = freezed,Object? imageUrl = null,Object? categoryId = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,letter: freezed == letter ? _self.letter : letter // ignore: cast_nullable_to_non_nullable
as String?,word: freezed == word ? _self.word : word // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SignModel].
extension SignModelPatterns on SignModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SignModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SignModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SignModel value)  $default,){
final _that = this;
switch (_that) {
case _SignModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SignModel value)?  $default,){
final _that = this;
switch (_that) {
case _SignModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String? letter,  String? word, @JsonKey(name: 'image_url')  String imageUrl, @JsonKey(name: 'category_id')  String categoryId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SignModel() when $default != null:
return $default(_that.id,_that.letter,_that.word,_that.imageUrl,_that.categoryId);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String? letter,  String? word, @JsonKey(name: 'image_url')  String imageUrl, @JsonKey(name: 'category_id')  String categoryId)  $default,) {final _that = this;
switch (_that) {
case _SignModel():
return $default(_that.id,_that.letter,_that.word,_that.imageUrl,_that.categoryId);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String? letter,  String? word, @JsonKey(name: 'image_url')  String imageUrl, @JsonKey(name: 'category_id')  String categoryId)?  $default,) {final _that = this;
switch (_that) {
case _SignModel() when $default != null:
return $default(_that.id,_that.letter,_that.word,_that.imageUrl,_that.categoryId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SignModel implements SignModel {
  const _SignModel({required this.id, this.letter, this.word, @JsonKey(name: 'image_url') required this.imageUrl, @JsonKey(name: 'category_id') required this.categoryId});
  factory _SignModel.fromJson(Map<String, dynamic> json) => _$SignModelFromJson(json);

@override final  String id;
@override final  String? letter;
@override final  String? word;
@override@JsonKey(name: 'image_url') final  String imageUrl;
@override@JsonKey(name: 'category_id') final  String categoryId;

/// Create a copy of SignModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SignModelCopyWith<_SignModel> get copyWith => __$SignModelCopyWithImpl<_SignModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SignModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SignModel&&(identical(other.id, id) || other.id == id)&&(identical(other.letter, letter) || other.letter == letter)&&(identical(other.word, word) || other.word == word)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,letter,word,imageUrl,categoryId);

@override
String toString() {
  return 'SignModel(id: $id, letter: $letter, word: $word, imageUrl: $imageUrl, categoryId: $categoryId)';
}


}

/// @nodoc
abstract mixin class _$SignModelCopyWith<$Res> implements $SignModelCopyWith<$Res> {
  factory _$SignModelCopyWith(_SignModel value, $Res Function(_SignModel) _then) = __$SignModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String? letter, String? word,@JsonKey(name: 'image_url') String imageUrl,@JsonKey(name: 'category_id') String categoryId
});




}
/// @nodoc
class __$SignModelCopyWithImpl<$Res>
    implements _$SignModelCopyWith<$Res> {
  __$SignModelCopyWithImpl(this._self, this._then);

  final _SignModel _self;
  final $Res Function(_SignModel) _then;

/// Create a copy of SignModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? letter = freezed,Object? word = freezed,Object? imageUrl = null,Object? categoryId = null,}) {
  return _then(_SignModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,letter: freezed == letter ? _self.letter : letter // ignore: cast_nullable_to_non_nullable
as String?,word: freezed == word ? _self.word : word // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
