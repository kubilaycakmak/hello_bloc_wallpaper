import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:hello_bloc_wallpaper/data/model/detail/video_error.dart';
import 'package:hello_bloc_wallpaper/data/repository/video_repository.dart';
import 'package:meta/meta.dart';
import 'detail_state.dart';
import 'detail_event.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {

  VideoRepository repository;

  DetailBloc(this.repository);

  void onShowDetail({@required String id}){
    dispatch(ShowDetail((b) => b..id = id));
  }
  // @override
  DetailState get initialState => DetailState.initial();

  @override
  Stream<DetailState> mapEventToState(
    DetailState currentState,
    DetailEvent event,
  ) async* {
    if(event is ShowDetail){
      yield DetailState.loading();

      try {
        final videoItem = await repository.fetchVideoInfo(id: event.id);
        yield DetailState.success(videoItem);
      } on VideoError catch (e) {
        yield DetailState.failure(e.message);
      }
    }
  }
}
