import 'package:hello_bloc_wallpaper/data/model/photo/model_details.dart';
import 'package:hello_bloc_wallpaper/data/model/photo/photo_response.dart';
import 'package:hello_bloc_wallpaper/data/network/api_key.dart';
import 'package:http/http.dart' as http;

import 'api_key.dart';

const int MAX_SEARCH_RESULT = 5;

class DataSource{
  final http.Client client;
  // final String _searchBaseUrl = 'https://www.googleapis.com/youtube'+
  // '/v3/search?part=snippet&maxResults=$MAX_SEARCH_RESULT'+
  // '&type=video&key=$API_KEY';

  final String _pixabayBaseURL = 'https://pixabay.com/api/?key=$API_KEY&per_page=$MAX_SEARCH_RESULT&editor_choice=true';

  // final String _videoBaseUrl = 'https://www.googleapis.com/youtube/v3/videos?part=snippet&key=$API_KEY';
  DataSource(this.client);

  Future<PhotoResponse> searchPhotos({String query, int page = 1, String orientation}) async{
    final urlRaw = _pixabayBaseURL + '&q=$query&page=$page&orientation=$orientation';
    final urlEncoded = Uri.encodeFull(urlRaw);
    final response = await client.get(urlEncoded);

    if(response.statusCode == 200){
      return PhotoResponse.fromJson(response.body);
    }else{
      throw 'fetch error!';
    }
  }
  
  Future<PhotoResponse> fetchPhoto({String order, String orientation}) async{
    final url = _pixabayBaseURL + '&order=$order&orientation=$orientation';
    final response = await client.get(url);

    if(response.statusCode == 200){
      return PhotoResponse.fromJson(response.body);
    }else{
      throw 'fetch error!';
    }
  }
}
