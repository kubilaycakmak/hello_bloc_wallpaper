
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../search_bloc.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({
    Key key,
  }) : super(key: key);

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {

  final _controller = TextEditingController();
  final _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      if(_focusNode.hasFocus){
        _controller.selection = TextSelection(baseOffset: 0, extentOffset: _controller.text.length);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: _focusNode,
      controller: _controller,
      decoration: InputDecoration(
        hintText: '\tSearch Videos',
        hintStyle: TextStyle(
        ),
        border: InputBorder.none,
        icon: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Icon(Icons.search, color: Colors.white70,),
        )
      ),
      onSubmitted: (searchQuery){
        BlocProvider.of<SearchBloc>(context).onSearchInitiated(searchQuery);
      },
    );
  }
}