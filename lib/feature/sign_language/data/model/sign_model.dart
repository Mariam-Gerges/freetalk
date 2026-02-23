import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_model.freezed.dart';
part 'sign_model.g.dart';

@freezed
class SignModel with _$SignModel {
  const factory SignModel({
    required String id,
    String? letter,
    String? word,
    @JsonKey(name: 'image_url') required String imageUrl,
    @JsonKey(name: 'category_id') required String categoryId,
  }) = _SignModel;

  factory SignModel.fromJson(Map<String, dynamic> json) =>
      _$SignModelFromJson(json);
      
        @override
        // TODO: implement categoryId
        String get categoryId => throw UnimplementedError();
      
        @override
        // TODO: implement id
        String get id => throw UnimplementedError();
      
        @override
        // TODO: implement imageUrl
        String get imageUrl => throw UnimplementedError();
      
        @override
        // TODO: implement letter
        String? get letter => throw UnimplementedError();
      
        @override
        Map<String, dynamic> toJson() {
          // TODO: implement toJson
          throw UnimplementedError();
        }
      
        @override
        // TODO: implement word
        String? get word => throw UnimplementedError();
}