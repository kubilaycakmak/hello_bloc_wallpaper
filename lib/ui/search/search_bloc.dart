import 'package:bloc/bloc.dart';
import 'package:hello_bloc_wallpaper/data/model/search/model_search.dart';
import 'package:hello_bloc_wallpaper/data/repository/video_repository.dart';
import 'package:hello_bloc_wallpaper/ui/search/search_event.dart';
import 'package:hello_bloc_wallpaper/ui/search/search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {

  final VideoRepository _videoRepository;

  SearchBloc(this._videoRepository) : super();

  void onSearchInitiated(String query){
    dispatch(SearchInitiated((b) => b..query = query));
  }

  void fetchNextResultPage(){
    dispatch(FetchNextResultPage());
  }

  @override
  SearchState get initialState => SearchState.initial();

  @override
  Stream<SearchState> mapEventToState(
    SearchState currentState,
    SearchEvent event,
  ) async* {
    if(event is SearchInitiated){
      yield* mapSearchInitiated(event);
    } else if(event is FetchNextResultPage){
      yield* mapFetchNextResultPage();
    }
  }
  Stream<SearchState> mapSearchInitiated(SearchInitiated event) async*{
    if(event.query.isEmpty){
        yield SearchState.initial();
    }else{
      yield SearchState.loading();
      try{
        final searchResult = await _videoRepository.searchVideos(event.query);
        yield SearchState.success(searchResult);
      }on SearchError catch(e){
        yield SearchState.failure(e.message);
      }on NoSearchResultException catch(e){
        yield SearchState.failure(e.message);
      }
    }
  }
  Stream<SearchState> mapFetchNextResultPage() async*{
    try {
      final nextPageResult = await _videoRepository.fetchNextResultPage();
      yield SearchState.success(currentState.searchResults + nextPageResult);
    }on NoNextPageTokenException catch (_) {
      yield currentState.rebuild((b) => b..hasReachedEndOfResults = true);
    }on SearchInitiatedException catch (e) {
      yield SearchState.failure(e.message);
    }on SearchError catch (e) {
      yield SearchState.failure(e.message);
    }
  } 
}

