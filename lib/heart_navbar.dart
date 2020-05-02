import 'dart:ui';

import 'package:flutter/material.dart';

class HearNavBar extends StatefulWidget {
  @override
  _HearNavBarState createState() => _HearNavBarState();
}

class _HearNavBarState extends State<HearNavBar>
    with SingleTickerProviderStateMixin {
  Animation<double> _animation;
  AnimationController _controller;
  var details = Offset(0, 0);
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    _animation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.375,
          0.500,
          curve: Curves.ease,
        ),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color(0xffF0718C),
        ),
        child: Stack(
          children: [
            AnimatedBuilder(
              animation: _animation,
              builder: (context, child) => SizedBox(
                child: CustomPaint(
                  painter: HeartBeatPainter(
                    offsets: details,
                    controller: _controller,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTapDown: (detailed) {
                setState(() {
                  details = detailed.globalPosition;
                });
              },
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.receipt),
                    Icon(Icons.receipt),
                    Icon(Icons.receipt),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HeartBeatPainter extends CustomPainter {
  Offset offsets;
  final AnimationController controller;
  HeartBeatPainter({this.offsets, this.controller});
  Paint p = Paint()
    ..color = Colors.yellow
    ..strokeWidth = 4
    ..strokeCap = StrokeCap.round;
  Paint ps = Paint()
    ..color = Colors.red
    ..strokeWidth = 4
    ..strokeCap = StrokeCap.round;

  @override
  void paint(Canvas canvas, Size size) {
    controller..forward();

    canvas.drawLine(Offset(0.0, 0.0), Offset(controller.value * 100, 0), p);
    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        draw(canvas);
      }
    });
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

  draw(canvas) {
    canvas.drawLine(Offset(100, 0), Offset(100, controller.value * -40.0), p);
  }
}
