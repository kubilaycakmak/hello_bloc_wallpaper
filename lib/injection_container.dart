import 'package:hello_bloc_wallpaper/data/network/data_sources.dart';
import 'package:hello_bloc_wallpaper/data/repository/video_repository.dart';
import 'package:hello_bloc_wallpaper/ui/detail/detail_bloc.dart';
import 'package:hello_bloc_wallpaper/ui/search/search_bloc.dart';
import 'package:kiwi/kiwi.dart' as kiwi;
import 'package:http/http.dart' as http;

void initKiwi(){
  kiwi.Container()..registerInstance(http.Client())
  ..registerFactory((container) => DataSource(container.resolve()))
  ..registerFactory((container) => VideoRepository(container.resolve()))
  ..registerFactory((container) => SearchBloc(container.resolve()))
  ..registerFactory((container) => DetailBloc(container.resolve()));
}