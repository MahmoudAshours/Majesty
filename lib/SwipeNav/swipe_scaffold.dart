import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subtlenavbar/SwipeNav/swipenav_controller.dart';

class SwipeScaffold extends StatelessWidget {
  final Widget child;
  SwipeScaffold({this.child});

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
