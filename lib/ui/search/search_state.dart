library search_state;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:hello_bloc_wallpaper/data/model/photo/photo_hits.dart';

part 'search_state.g.dart'; 

abstract class SearchState implements Built<SearchState, SearchStateBuilder> {
  bool get isLoading;
  BuiltList<PhotoHits> get searchResults;
  String get error;
  bool get hasReachedEndOfResults;

  bool get isInitial => !isLoading && searchResults.isEmpty && error == '';
  bool get isSuccessful =>
      !isLoading && searchResults.isNotEmpty && error == '';

  SearchState._();

  factory SearchState([updates(SearchStateBuilder b)]) = _$SearchState;
  factory SearchState.initial(){
    return SearchState((b) => b
    ..isLoading = false
    ..searchResults.replace(BuiltList<PhotoHits>())
    ..error = ''
    ..hasReachedEndOfResults = false);
  }
    factory SearchState.loading(){
    return SearchState((b) => b
    ..isLoading = true
    ..searchResults.replace(BuiltList<PhotoHits>())
    ..error = ''
    ..hasReachedEndOfResults = false);
  }
    factory SearchState.failure(String error){
    return SearchState((b) => b
    ..isLoading = false
    ..searchResults.replace(BuiltList<PhotoHits>())
    ..error = error
    ..hasReachedEndOfResults = false);
  }
    factory SearchState.success(BuiltList<PhotoHits> resultList){
    return SearchState((b) => b
    ..isLoading = false
    ..searchResults.replace(resultList)
    ..error = ''
    ..hasReachedEndOfResults = false);
  }
}