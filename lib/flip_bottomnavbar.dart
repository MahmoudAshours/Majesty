// import 'package:flutter/material.dart';

// class FlipBottomNavBar extends StatefulWidget {
//   final Color backgroundColor;
//   final Color selectorColor;
//   final Color selectedItemColor;
//   final Color nonSelectedIconColor;
//   final Curve animationCurve;
//   final Duration animationDuration;
//   final List<Widget> items;
//   final List<String> captions;
//   final List<GlobalKey> keys = List();
//   final List<TextStyle> captionsTextStyles;
//   final ValueChanged<int> onItemPressed;

//   FlipBottomNavBar({
//     @required this.items,
//     @required this.captions,
//     @required this.onItemPressed,
//     @required this.captionsTextStyles,
//     this.backgroundColor = const Color(0xff422FBC),
//     this.selectorColor = const Color(0xFFFFFFFF),
//     this.nonSelectedIconColor,
//     this.selectedItemColor,
//     this.animationCurve = Curves.easeInSine,
//     this.animationDuration = const Duration(milliseconds: 100),
//   })  : assert(items.length == captions.length),
//         assert(onItemPressed != null),
//         assert(items.length >= 2),
//         assert(captions.length == captionsTextStyles.length) {
//     for (int i = 0; i < items.length; i++) {
//       keys.add(GlobalKey());
//     }
//   }
//   @override
//   _FlipBottomNavBarState createState() => _FlipBottomNavBarState();
// }

// class _FlipBottomNavBarState extends State<FlipBottomNavBar>
//     with TickerProviderStateMixin {
//   var _currentIndex = 0;
//   Animation<Offset> _transitionAnimation;
//   AnimationController _controller;

//   Color _splashColor = Color(0xffD1CEE1);
//   @override
//   void initState() {
//     _controller =
//         AnimationController(vsync: this, duration: Duration(seconds: 1));

//     _transitionAnimation =
//         Tween(begin: Offset.zero, end: Offset(0, -2)).animate(_controller);
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: MediaQuery.of(context).size.width,
//       height: 100,
//       color: widget.backgroundColor,
//       child: Row(
//         children: widget.items
//             .asMap()
//             .map(
//               (int index, Widget iconItem) => MapEntry(
//                 index,
//                 Expanded(
//                   flex: 1,
//                   key: widget.keys[index],
//                   child: Stack(
//                     children: [
//                       Center(
//                         child: Material(
//                           type: MaterialType.transparency,
//                           child: InkWell(
//                             borderRadius: BorderRadius.circular(100),
//                             focusColor: Colors.red,
//                             splashColor: _splashColor,
//                             radius: 50,
//                             enableFeedback: true,
//                             excludeFromSemantics: true,
//                             customBorder: Border.all(
//                               color: Colors.red,
//                               width: 30,
//                               style: BorderStyle.solid,
//                             ),
//                             highlightColor: Colors.transparent,
//                             onHighlightChanged: (d) {},
//                             onTap: () {
//                               setState(
//                                 () {
//                                   _currentIndex = index;
//                                 },
//                               );
//                             },
//                             child: Container(
//                               width: 100,
//                               height: 200,
//                               decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(40)),
//                               child: SlideTransition(
//                                 position: _transitionAnimation,
//                                 child: IconTheme(
//                                   data: IconThemeData(
//                                     color: _currentIndex == index
//                                         ? widget.selectedItemColor
//                                         : widget.nonSelectedIconColor,
//                                   ),
//                                   child: Column(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: <Widget>[
//                                       iconItem,
//                                       SizedBox(
//                                         height: 10,
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             )
//             .values
//             .toList(),
//       ),
//     );
//   }
// }

// class CustomInk extends InkResponse {}
