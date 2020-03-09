import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_bloc_wallpaper/data/model/photo/photo_hits.dart';
import 'package:hello_bloc_wallpaper/ui/search/search_bloc.dart';
import 'package:hello_bloc_wallpaper/ui/search/widget/centered_message.dart';
import 'package:kiwi/kiwi.dart' as kiwi;

import 'search_state.dart';
import 'widget/centered_message.dart';
import 'widget/search_bar.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _searchBloc = kiwi.Container().resolve<SearchBloc>();
  final _scrollController = ScrollController();
  int pageController = 1;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: _searchBloc,
      child: _buildScaffold(),
    );
  }

  @override
  void dispose() { 
    super.dispose();
    _searchBloc.dispose();
  }

  Scaffold _buildScaffold() {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black45,
        title: SearchBar(),
      ),
      body: BlocBuilder(
        bloc: _searchBloc,
        builder: (context, SearchState state){
          if(state.isInitial){
           return CenteredMessage(
             message: 'start search photos',
             iconData: Icons.photo_album,
           );
          }if(state.isLoading){
            return Center(child: CircularProgressIndicator());
          }if(state.isSuccessful){
            return _buildResultList(state);
          }else{
            return CenteredMessage(message: state.error, iconData: Icons.error,);
          }
        },
      ),
    );
  }
  Widget _buildResultList(SearchState state){
    return NotificationListener<ScrollNotification>(
      onNotification: _handleScrollNotification,
      child: ListView.builder(
        itemCount: _calculateListItemCount(state),
        controller: _scrollController,
        itemBuilder: (context, index){
          return index >= state.searchResults.length
          ? _buildLoaderListItem()
          : _buildVideoListItem(state.searchResults[index]);
        },
      ),
    );
  }
  int _calculateListItemCount(SearchState state){
    if(state.hasReachedEndOfResults){
      return state.searchResults.length;
    }else{
      return state.searchResults.length + 1;
    }
  }
  bool _handleScrollNotification(ScrollNotification notification){
    if(notification is ScrollEndNotification &&
    _scrollController.position.extentAfter == 0){
      _searchBloc.fetchNextResultPage(pageController);
      setState(() {
        pageController += 1;
        print(pageController);
      });
    }
    return false;
  }
  Widget _buildVideoListItem(PhotoHits photoHits){
    return GestureDetector(
      child: _buildVideoListItemCard(photoHits),
      onTap: (){
        print('haha');
      },
      // onTap: (){
      //   Navigator.push(context, MaterialPageRoute(
      //     builder: (_){
      //       return DetailPage(videoId: searchItem.id.videoId,);
      //      }
      //     )
      //   );
      // },
    );
  }
  Widget _buildVideoListItemCard(PhotoHits photoHits){
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Image.network(photoHits.webformatURL, fit: BoxFit.cover,
              )
            ),
            SizedBox(height: 5,),
            Text(photoHits.id.toString(), maxLines: 1, textScaleFactor: 1.1, style: TextStyle(fontWeight: FontWeight.bold), textAlign: TextAlign.start, overflow: TextOverflow.ellipsis,)
          ],
        ),
      ),
    );
  }
}
Widget _buildLoaderListItem(){
  return Center(
    child: CircularProgressIndicator(),
    heightFactor: 2,
  );
}
