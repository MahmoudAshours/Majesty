import 'package:flutter/material.dart';
import 'package:subtlenavbar/MajestyCasinoNavigationBar/casino_navbar.dart';
import 'package:subtlenavbar/MajestySubtleNav/subtle_bottomnavbar.dart';
import 'package:subtlenavbar/MajestySwipeNav/swipe_nav.dart';
import 'package:subtlenavbar/MajestySwipeNav/swipe_scaffold.dart';

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
      debugShowCheckedModeBanner: false,
      color: Colors.red,
      home: Scaffold(
        backgroundColor: Colors.black12,
        body: Center(child: widgets[current]),
        bottomNavigationBar: MajestyCasinoNavigationBar(
          items: null,
          captions: null,
          currentIndex: 0,
          onItemPressed: null,
          captionsTextStyles: null,
        ),
      ),
    );
  }
}
