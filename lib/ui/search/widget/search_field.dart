
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
  String orientation;

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
    return buildTextField(context);
  }

  TextField buildTextField(BuildContext context) {
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
      ),
      suffixIcon: PopupMenuButton(
        onSelected: (value){
          setState(() {
            orientation = value;
          });
        },
        icon: Icon(Icons.more_horiz),
        itemBuilder: (BuildContext context) { 
          var list = List<PopupMenuEntry<Object>>();
          list.add(PopupMenuItem(
            child: Text('Vertical'),
            value: 'vertical',
          ));
          list.add(
            PopupMenuDivider(
              height: 10,
            ),
          );
          list.add(PopupMenuItem(
            child: Text('Horizontal'),
            value: 'horizontal',
          ));
          return list;
         },
      )
    ),
    onSubmitted: (searchQuery){
      print(orientation);
      if(orientation == null){
        BlocProvider.of<SearchBloc>(context).onSearchInitiated(searchQuery, 1, 'vertical');
      }else{
        BlocProvider.of<SearchBloc>(context).onSearchInitiated(searchQuery, 1, orientation);
      }
    },
  );
  }
}