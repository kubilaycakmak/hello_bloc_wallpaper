library video_snippet;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:hello_bloc_wallpaper/data/model/search/model_search.dart';
import 'package:hello_bloc_wallpaper/data/model/search/serializer/serializers.dart';

part 'video_snippet.g.dart';

abstract class VideoSnippet implements Built<VideoSnippet, VideoSnippetBuilder> {
  String get publishedAt;
  String get channelId;
  String get title;
  Thumbnails get thumbnails;
  String get description;
  String get channelTitle;
  BuiltList<String> get tags;
  

  VideoSnippet._();

  factory VideoSnippet([updates(VideoSnippetBuilder b)]) = _$VideoSnippet;

  String toJson() {
    return json.encode(serializers.serializeWith(VideoSnippet.serializer, this));
  }

  static VideoSnippet fromJson(String jsonString) {
    return serializers.deserializeWith(VideoSnippet.serializer, json.decode(jsonString));
  }

  static Serializer<VideoSnippet> get serializer => _$videoSnippetSerializer;
}