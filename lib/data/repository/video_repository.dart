import 'package:built_collection/built_collection.dart';
import 'package:hello_bloc_wallpaper/data/model/detail/model_details.dart';
import 'package:hello_bloc_wallpaper/data/model/search/model_search.dart';
import 'package:hello_bloc_wallpaper/data/network/data_sources.dart';

class VideoRepository{
  DataSource _dataSource;

  String _lastSearchQuery;
  String _nextPageToken;

  VideoRepository(this._dataSource);

  Future<BuiltList<SearchItem>> searchVideos(String query) async{
    final searchResult = await _dataSource.searchVideos(query: query);
    _cacheValues(query: query, nextPageToken: searchResult.nextPageToken);
    if(searchResult.items.isEmpty) throw NoSearchResultException();
    return searchResult.items;
  }

  void _cacheValues({String query, String nextPageToken}){
    _lastSearchQuery = query;
    _nextPageToken = nextPageToken;
  }
  Future<BuiltList<SearchItem>> fetchNextResultPage() async{
    if(_lastSearchQuery == null){
      throw SearchInitiatedException();
    }
    if(_nextPageToken == null){
      throw NoNextPageTokenException();
    }

    final nextPageSearchResult = await _dataSource.searchVideos(query: _lastSearchQuery, pageToken: _nextPageToken);
    _cacheValues(query: _lastSearchQuery, nextPageToken: nextPageSearchResult.nextPageToken);
  
    return nextPageSearchResult.items;
  }
  Future<VideoItem> fetchVideoInfo({String id}) async{
    final videoResponse = await _dataSource.fetchVideoInfo(id: id);
    if(videoResponse.items.isEmpty) throw NoSuchVideoException();
    return videoResponse.items[0];
  }
}


class SearchInitiatedException implements Exception{
  final message = 'Cannot get the next result page without searching first query';
}

class NoSearchResultException implements Exception{
  final message = 'No result';
}

class NoNextPageTokenException implements Exception{
  final message = 'Cannot get the next result page';
}

class NoSuchVideoException implements Exception{
  final String message = 'No such video';
}