library search_event;

import 'package:built_value/built_value.dart';
part 'search_event.g.dart';

abstract class SearchEvent{}

abstract class SearchInitiated extends SearchEvent implements Built<SearchInitiated, SearchInitiatedBuilder> {
  String get query;
  int get page;
  String get orientation;


  SearchInitiated._();

  factory SearchInitiated([updates(SearchInitiatedBuilder b)]) = _$SearchInitiated;
}

class FetchNextResultPage extends SearchEvent{
  final int page;
  FetchNextResultPage(this.page);
}