import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class MajestyCasinoNavigationBar extends StatefulWidget {
  final Color backgroundColor;
  final Color selectorColor;
  final Color selectedItemColor;
  final Color nonSelectedIconColor;
  final Curve animationCurve;
  final Duration animationDuration;
  final int currentIndex;
  final List<Widget> items;
  final List<String> captions;
  final TextStyle captionsTextStyles;
  final ValueChanged<int> onItemPressed;
  MajestyCasinoNavigationBar({
    @required this.items,
    @required this.captions,
    @required this.onItemPressed,
    @required this.captionsTextStyles,
    this.currentIndex = 0,
    this.backgroundColor = const Color(0xff422FBC),
    this.selectorColor = const Color(0xFFFFFFFF),
    this.nonSelectedIconColor,
    this.selectedItemColor,
    this.animationCurve = Curves.easeInSine,
    this.animationDuration = const Duration(milliseconds: 500),
  });
  @override
  _MajestyCasinoNavigationBarState createState() =>
      _MajestyCasinoNavigationBarState();
}

class _MajestyCasinoNavigationBarState extends State<MajestyCasinoNavigationBar>
    with TickerProviderStateMixin {
  var _currentIndex = 0;
  double beaconRadius;
  double maxBeaconRadius = 20;
  Animation<double> _animation, _lineAnimation;
  AnimationController _animationController;

  @override
  void initState() {
    beaconRadius = 0;
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _animation = Tween(begin: 10.0, end: 04.0).animate(_animationController);
    _lineAnimation = Tween(begin: 0.0, end: 10.0).animate(_animationController);
    SchedulerBinding.instance.addPostFrameCallback((_) {
      setState(() {});
    });
    super.initState();
  }

  @override
  void didUpdateWidget(MajestyCasinoNavigationBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.currentIndex != widget.currentIndex) {
      _startAnimation();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 100,
      color: Color(0xff291032),
      child: SafeArea(
        child: Stack(
          children: <Widget>[
            AnimatedPositioned(
              bottom: 20,
              left: 100,
              child: Container(
                width: 20,
                height: 2,
                color: Colors.red,
              ),
              duration: Duration(seconds: 2),
            ),
            Row(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: AnimatedBuilder(
                            animation: _animation,
                            builder: (_, child) => ScaleTransition(
                              scale: _animation,
                              child: child,
                            ),
                            child: GestureDetector(
                              onTap: () => _startAnimation(),
                              child: Icon(
                                Icons.dashboard,
                                size: 5,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Text('Dashboard'),
                      ],
                    ),
                    Container(),
                  ],
                ),
              ],
            ),
            Positioned(
              left: 100,
              child: CustomPaint(
                painter: BeaconPainter(
                  beaconRadius: beaconRadius,
                  maxBeaconRadius: maxBeaconRadius,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _startAnimation() {
    _animationController = AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: this,
    );
    final _curve =
        CurvedAnimation(parent: _animationController, curve: Curves.linear);
    Tween<double>(begin: 0, end: 1).animate(_curve)
      ..addListener(() {
        setState(() {
          beaconRadius = maxBeaconRadius * _curve.value;
        });
      });
    _animationController.forward();
  }
}

class BeaconPainter extends CustomPainter {
  final double beaconRadius;
  final double maxBeaconRadius;
  BeaconPainter({this.beaconRadius , this.maxBeaconRadius});
  @override
  void paint(Canvas canvas, Size size) {
    if (beaconRadius == maxBeaconRadius) {
      return;
    }
    double strokeWidth = beaconRadius < maxBeaconRadius * 0.5
        ? beaconRadius
        : maxBeaconRadius - beaconRadius;
    final paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = strokeWidth;
    canvas.drawLine(
        Offset(beaconRadius, 10), Offset(maxBeaconRadius, 10), paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
