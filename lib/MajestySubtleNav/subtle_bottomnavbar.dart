import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class MajestySubtleBottomNavBar extends StatefulWidget {
  final Color backgroundColor;
  final Color selectorColor;
  final Color selectedItemColor;
  final Color nonSelectedIconColor;
  final Curve animationCurve;
  final Duration animationDuration;
  final List<GlobalKey> keys = List();
  final List<Widget> items;
  final List<String> captions;
  final List<TextStyle> captionsTextStyles;
  final ValueChanged<int> onItemPressed;
  MajestySubtleBottomNavBar({
    @required this.items,
    @required this.captions,
    @required this.onItemPressed,
    @required this.captionsTextStyles,
    this.backgroundColor = const Color(0xff422FBC),
    this.selectorColor = const Color(0xFFFFFFFF),
    this.nonSelectedIconColor,
    this.selectedItemColor,
    this.animationCurve = Curves.easeInSine,
    this.animationDuration = const Duration(milliseconds: 500),
  })  : assert(items.length == captions.length),
        assert(items.length >= 2),
        assert(captions.length == captionsTextStyles.length) {
    for (int i = 0; i < items.length; i++) {
      keys.add(GlobalKey());
    }
  }
  @override
  _MajestySubtleBottomNavBarState createState() =>
      _MajestySubtleBottomNavBarState();
}

class _MajestySubtleBottomNavBarState extends State<MajestySubtleBottomNavBar>
    with SingleTickerProviderStateMixin {
  double _padding = 0.0;
  var _opacity = 1.0;
  var _position = 0.0;
  var _currentIndex = 0;

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback(
      (_) {
        _position = _getPosition();
        setState(() {});
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 100,
      color: widget.backgroundColor,
      child: Stack(
        children: <Widget>[
          AnimatedPositioned(
            height: 60,
            width: 130,
            left: _position,
            onEnd: () {
              widget.onItemPressed(_currentIndex);
            },
            bottom: 20,
            child: Opacity(
              opacity: 0.2,
              child: Container(
                decoration: BoxDecoration(
                  color: widget.selectorColor,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            curve: widget.animationCurve,
            duration: widget.animationDuration,
          ),
          Align(
            alignment: Alignment.center,
            child: Row(
              children: widget.items
                  .asMap()
                  .map(
                    (int index, Widget iconItem) => MapEntry(
                      index,
                      Expanded(
                        flex: 1,
                        child: GestureDetector(
                          onTap: () {
                            RenderBox box = widget.keys[index].currentContext
                                .findRenderObject();
                            Offset position = box.localToGlobal(Offset.zero);

                            setState(
                              () {
                                _position = position.dx;
                                _opacity = 1;
                                _padding = 15;
                                _currentIndex = index;
                              },
                            );
                          },
                          child: Align(
                            alignment: Alignment.center,
                            child: Container(
                              key: widget.keys[index],
                              width: 130,
                              child: Row(
                                children: [
                                  AnimatedPadding(
                                    duration: Duration(milliseconds: 100),
                                    padding: EdgeInsets.only(
                                      right:
                                          _currentIndex == index ? _padding : 0,
                                    ),
                                    child: IconTheme(
                                      data: IconThemeData(
                                        color: _currentIndex == index
                                            ? widget.selectedItemColor
                                            : widget.nonSelectedIconColor,
                                      ),
                                      child: iconItem,
                                    ),
                                  ),
                                  Expanded(
                                    child: AnimatedOpacity(
                                      opacity:
                                          _currentIndex == index ? _opacity : 0,
                                      duration: Duration(
                                        milliseconds: 100,
                                      ),
                                      child: Text(
                                        widget.captions[index],
                                        style: widget.captionsTextStyles[index],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                  .values
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  double _getPosition() {
    RenderBox box = widget.keys[0].currentContext.findRenderObject();
    Offset position = box.localToGlobal(Offset.zero);
    return position.dx;
  }
}
