library video_response;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:hello_bloc_wallpaper/data/model/detail/video_item.dart';
import 'package:hello_bloc_wallpaper/data/model/search/serializer/serializers.dart';

part 'video_response.g.dart';

abstract class VideoResponse implements Built<VideoResponse, VideoResponseBuilder> {
  BuiltList<VideoItem> get items;

  VideoResponse._();

  factory VideoResponse([updates(VideoResponseBuilder b)]) = _$VideoResponse;

  String toJson() {
    return json.encode(serializers.serializeWith(VideoResponse.serializer, this));
  }

  static VideoResponse fromJson(String jsonString) {
    return serializers.deserializeWith(VideoResponse.serializer, json.decode(jsonString));
  }

  static Serializer<VideoResponse> get serializer => _$videoResponseSerializer;
}