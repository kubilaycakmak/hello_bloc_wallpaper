library search_snippet;

import 'dart:convert';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:hello_bloc_wallpaper/data/model/search/serializer/serializers.dart';
import 'package:hello_bloc_wallpaper/data/model/search/thumbnails.dart';

part 'search_snippet.g.dart';

abstract class SearchSnippet implements Built<SearchSnippet, SearchSnippetBuilder> {
  String get publishedAt;
  String get channelId;
  String get title;
  String get description;
  Thumbnails get thumbnails;
  String get channelTitle;

  SearchSnippet._();

  factory SearchSnippet([updates(SearchSnippetBuilder b)]) = _$SearchSnippet;

  String toJson() {
    return json.encode(serializers.serializeWith(SearchSnippet.serializer, this));
  }

  static SearchSnippet fromJson(String jsonString) {
    return serializers.deserializeWith(SearchSnippet.serializer, json.decode(jsonString));
  }

  static Serializer<SearchSnippet> get serializer => _$searchSnippetSerializer;
}