// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SignModel _$SignModelFromJson(Map<String, dynamic> json) => _SignModel(
  id: json['id'] as String,
  letter: json['letter'] as String?,
  word: json['word'] as String?,
  imageUrl: json['image_url'] as String,
  categoryId: json['category_id'] as String,
);

Map<String, dynamic> _$SignModelToJson(_SignModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'letter': instance.letter,
      'word': instance.word,
      'image_url': instance.imageUrl,
      'category_id': instance.categoryId,
    };
