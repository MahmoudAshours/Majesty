import 'package:flutter/material.dart';
import 'package:subtlenavbar/SwipeNav/swipe_nav.dart';

import 'SwipeNav/swipe_scaffold.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Widget> widgets = List.unmodifiable([
    FlutterLogo(size: 500),
    FlutterLogo(colors: Colors.amber, size: 500),
    FlutterLogo(colors: Colors.red, size: 500)
  ]);

  int current = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      color: Colors.red,
      home: SwipeScaffold(
        child: Scaffold(
          backgroundColor: Colors.black12,
          body: Center(child: widgets[current]),
          bottomNavigationBar: SwipeNavigationBar(
              captions: ['Home', 'Search', 'Profile'],
              backgroundColor: Colors.white,
              swipedHeight: 160,
              selectedItemColor: Colors.blue,
              captionsTextStyle:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
              items: <Widget>[
                Icon(Icons.home),
                Icon(Icons.search),
                Icon(Icons.supervised_user_circle)
              ],
              onItemPressed: (int i) => setState(() => current = i)),
        ),
      ),
    );
  }
}
