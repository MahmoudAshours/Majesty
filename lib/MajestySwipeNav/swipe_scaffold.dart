import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subtlenavbar/MajestySwipeNav/swipenav_controller.dart'; 
class MajestySwipeScaffold extends StatelessWidget {
  final Widget child;
  MajestySwipeScaffold({this.child});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: SwipeNavController(),
      child: Consumer<SwipeNavController>(
        builder: (_, bloc, __) => GestureDetector(
          child: child,
          onVerticalDragUpdate: (details) {
            if (details.delta.dy > 0) {
              bloc.show = false;
            } else {
              bloc.show = true;
            }
          },
        ),
      ),
    );
  }
}
