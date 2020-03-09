import 'package:bloc/bloc.dart';
import 'package:hello_bloc_wallpaper/data/model/photo/model_details.dart';
import 'package:hello_bloc_wallpaper/data/repository/photo_repository.dart';
import 'package:hello_bloc_wallpaper/ui/search/search_event.dart';
import 'package:hello_bloc_wallpaper/ui/search/search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {

  final PhotoRepository _photoRepository;

  SearchBloc(this._photoRepository) : super();

  void onSearchInitiated(String query, int page, String orientation){
    dispatch(SearchInitiated((b) => b..query = query ..page = page ..orientation = orientation));
  }

  void fetchNextResultPage(int page){
    dispatch(FetchNextResultPage(page));
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
      yield* mapFetchNextResultPage(event.page);
    }
  }
  Stream<SearchState> mapSearchInitiated(SearchInitiated event) async*{
    if(event.query.isEmpty){
        yield SearchState.initial();
    }else{
      yield SearchState.loading();
      try{
        final searchResult = await _photoRepository.searchPhotos(event.query, 1, event.orientation);
        print(event.orientation);
        yield SearchState.success(searchResult);
      }on PhotoError catch(e){
        yield SearchState.failure(e.message);
      }on NoSearchResultException catch(e){
        yield SearchState.failure(e.message);
      }
    }
  }
  Stream<SearchState> mapFetchNextResultPage(int page) async*{
    try {
      final nextPageResult = await _photoRepository.fetchNextResultPage();
      yield SearchState.success(currentState.searchResults + nextPageResult);
    }on NoNextPageTokenException catch (_) {
      yield currentState.rebuild((b) => b..hasReachedEndOfResults = true);
    }on SearchInitiatedException catch (e) {
      yield SearchState.failure(e.message);
    }on PhotoError catch (e) {
      yield SearchState.failure(e.message);
    }
  } 
}

