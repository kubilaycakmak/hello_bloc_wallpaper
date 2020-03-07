import 'dart:convert';

import 'package:hello_bloc_wallpaper/data/model/detail/video_error.dart';
import 'package:hello_bloc_wallpaper/data/model/detail/video_response.dart';
import 'package:hello_bloc_wallpaper/data/model/search/model_search.dart';
import 'package:hello_bloc_wallpaper/data/network/api_key.dart';
import 'package:http/http.dart' as http;

const int MAX_SEARCH_RESULT = 5;

class DataSource{
  final http.Client client;
  final String _searchBaseUrl = 'https://www.googleapis.com/youtube'+
  '/v3/search?part=snippet&maxResults=$MAX_SEARCH_RESULT'+
  '&type=video&key=$API_KEY';

  final String _videoBaseUrl = 'https://www.googleapis.com/youtube/v3/videos?part=snippet&key=$API_KEY';
  DataSource(this.client);

  Future<SearchResult> searchVideos({String query, String pageToken = '',}) async{
    final urlRaw = _searchBaseUrl + '&q=$query' + 
      (pageToken.isNotEmpty ? '&pageToken=$pageToken' : '');
    final urlEncoded = Uri.encodeFull(urlRaw);
    final response = await client.get(urlEncoded);

    if(response.statusCode == 200){
      return SearchResult.fromJson(response.body);
    }else{
      throw SearchError(json.decode(response.body)['error']['message']);
    }
  }
  
  Future<VideoResponse> fetchVideoInfo({String id}) async{
    final url = _videoBaseUrl + '&id=$id';
    final response = await client.get(url);

    if(response.statusCode == 200){
      return VideoResponse.fromJson(response.body);
    }else{
      throw VideoError(json.decode(response.body)['error']['message']);
    }
  }
}
