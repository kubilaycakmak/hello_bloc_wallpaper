library video_item;

import 'dart:convert';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:hello_bloc_wallpaper/data/model/detail/video_snippet.dart';
import 'package:hello_bloc_wallpaper/data/model/search/serializer/serializers.dart';

part 'video_item.g.dart';
abstract class VideoItem implements Built<VideoItem, VideoItemBuilder> {
  String get id;
  VideoSnippet get snippet;
  
  VideoItem._();

  factory VideoItem([updates(VideoItemBuilder b)]) = _$VideoItem;

  String toJson() {
    return json.encode(serializers.serializeWith(VideoItem.serializer, this));
  }

  static VideoItem fromJson(String jsonString) {
    return serializers.deserializeWith(VideoItem.serializer, json.decode(jsonString));
  }

  static Serializer<VideoItem> get serializer => _$videoItemSerializer;
}