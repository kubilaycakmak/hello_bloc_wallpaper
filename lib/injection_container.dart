import 'package:hello_bloc_wallpaper/data/network/data_sources.dart';
import 'package:hello_bloc_wallpaper/ui/search/search_bloc.dart';
import 'package:kiwi/kiwi.dart' as kiwi;
import 'package:http/http.dart' as http;
import 'data/repository/photo_repository.dart';


void initKiwi(){
  kiwi.Container()..registerInstance(http.Client())
  ..registerFactory((container) => DataSource(container.resolve()))
  ..registerFactory((container) => PhotoRepository(container.resolve()))
  ..registerFactory((container) => SearchBloc(container.resolve()));
}