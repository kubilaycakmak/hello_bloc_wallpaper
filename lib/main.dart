import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hello_bloc_wallpaper/injection_container.dart';
import 'package:hello_bloc_wallpaper/ui/search/search_page.dart';

void main() { 
  initKiwi();
  runApp(MyApp());
  }

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Video',
      color: Colors.red,
      home: SearchPage(),
    );
  }
}