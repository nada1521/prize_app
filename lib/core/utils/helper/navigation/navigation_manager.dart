import 'package:flutter/material.dart' show NavigatorState, GlobalKey, BuildContext;

class NavigatorManager {
  NavigatorManager._();

  static final navigatorKey = GlobalKey<NavigatorState>();

  static BuildContext getContext() => NavigatorManager.navigatorKey.currentContext!;
}
