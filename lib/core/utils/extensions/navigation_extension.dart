import 'package:prize/core/utils/helper/navigation/push_and_finish.dart' as paf;
import 'package:prize/core/utils/helper/navigation/push_to.dart';
import 'package:flutter/material.dart';

extension Navigation on BuildContext {
  Future<dynamic> pushNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushNamedFinish(
    String routeName, {
    Object? arguments,
    RoutePredicate? predicate,
  }) {
    return Navigator.of(this).pushNamedAndRemoveUntil(
      routeName,
      predicate ?? (route) => false,
      arguments: arguments,
    );
  }

  Future<T?> pushTo<T>(Widget screen) async {
    return await Navigator.push<T>(
      this,
      MaterialPageRoute(
        builder: (context) => screen,
      ),
    );
  }

  /// Navigation with Slide Transition *(for **android** only, **ios** uses default transition)*`
  Future<T?> pushToSlideX<T>(Widget screen) async {
    return await AppNavigator.pushSlideX<T>(this, screen);
  }

  Future<void> pushAndFinish<T>(Widget screen) async {
    return await paf.pushAndFinish(this, screen);
  }

  void pop<T extends Object?>() {
    return Navigator.pop<T>(this);
  }
}
