import 'package:flutter/foundation.dart';

class SwipeNavController with ChangeNotifier {
  var _show = false;
  set show(bool show) {
    _show = show;
    notifyListeners();
  }

  get show => _show;
}
