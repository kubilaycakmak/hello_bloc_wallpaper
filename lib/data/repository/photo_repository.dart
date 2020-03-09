import 'package:built_collection/built_collection.dart';
import 'package:hello_bloc_wallpaper/data/model/photo/photo_hits.dart';
import 'package:hello_bloc_wallpaper/data/network/data_sources.dart';

class PhotoRepository{
  DataSource _dataSource;

  String _lastSearchQuery;
  int _page = 1;
  PhotoRepository(this._dataSource);

  Future<BuiltList<PhotoHits>> searchPhotos(String query, int page, String orientation) async{
    final searchResult = await _dataSource.searchPhotos(query: query, page: page, orientation: orientation);
    _cacheValues(query: query);
    if(searchResult.hits.isEmpty) throw NoSearchResultException();
    return searchResult.hits;
  }

  void _cacheValues({String query, int page}){
    _lastSearchQuery = query;
    _page = page;
    print('page: $_page');
  }
  Future<BuiltList<PhotoHits>> fetchNextResultPage() async{
    if(_lastSearchQuery == null){
      throw SearchInitiatedException();
    }
    if(_page == null){
      _page = 1;
    }
    _page++;
    final nextPageSearchResult = await _dataSource.searchPhotos(query: _lastSearchQuery, page: _page);
    _cacheValues(query: _lastSearchQuery, page: _page);
    return nextPageSearchResult.hits;
  }

  Future<BuiltList<PhotoHits>> fetchPhotos({String order, String orientation}) async{
    final photoResponse = await _dataSource.fetchPhoto(order: order, orientation: orientation);
    if(photoResponse.hits.isEmpty) throw NoSuchVideoException();
    return photoResponse.hits;
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