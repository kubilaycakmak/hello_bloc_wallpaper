library photo_response;

import 'dart:convert';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'model_details.dart';
import 'serializer/serializers.dart';

part 'photo_response.g.dart';

abstract class PhotoResponse implements Built<PhotoResponse, PhotoResponseBuilder> {
  BuiltList<PhotoHits> get hits;

  PhotoResponse._();

  factory PhotoResponse([updates(PhotoResponseBuilder b)]) = _$PhotoResponse;

  String toJson() {
    return json.encode(serializers.serializeWith(PhotoResponse.serializer, this));
  }

  static PhotoResponse fromJson(String jsonString) {
    return serializers.deserializeWith(PhotoResponse.serializer, json.decode(jsonString));
  }

  static Serializer<PhotoResponse> get serializer => _$photoResponseSerializer;
}