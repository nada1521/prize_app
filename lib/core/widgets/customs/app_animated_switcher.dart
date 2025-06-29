import 'package:flutter/material.dart';

class AppAnimatedSwitcher extends StatelessWidget {
  const AppAnimatedSwitcher({
    super.key,
    this.duration = const Duration(milliseconds: 310),
    this.switchInCurve = Curves.easeInOut,
    this.switchOutCurve = Curves.easeOutQuad,
    this.beginPosition = const Offset(0.02, 0.1),
    required this.child,
  });

  final Duration duration;
  final Curve switchInCurve;
  final Curve switchOutCurve;
  final Offset beginPosition;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: duration,
      switchInCurve: switchInCurve,
      switchOutCurve: switchOutCurve,
      transitionBuilder: (child, animation) {
        return FadeTransition(
          opacity: animation,
          child: SlideTransition(
            position: Tween<Offset>(
              begin: beginPosition,
              end: const Offset(0, 0),
            ).animate(animation),
            child: child,
          ),
        );
      },
      child: child,
    );
  }
}
