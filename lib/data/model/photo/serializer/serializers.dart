library serializers;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:hello_bloc_wallpaper/data/model/photo/photo_hits.dart';
import 'package:hello_bloc_wallpaper/data/model/photo/photo_response.dart';

part 'serializers.g.dart';

@SerializersFor(const [
  PhotoHits,
  PhotoResponse
])
final Serializers serializers = 
  (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
