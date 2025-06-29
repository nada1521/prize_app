part of 'app_router.dart';

abstract class _RouterBuilder {
  static PageRoute<T> defaultPageRoute<T>({required Widget child}) {
    return _materialPageRoute(child: child);
  }

  static PageRoute<T> _materialPageRoute<T>({required Widget child}) {
    return MaterialPageRoute<T>(
      builder: (context) => child,
    );
  }

  static final _duration = const Duration(milliseconds: 250);
  static final _tweenSlide = Tween(
    begin: const Offset(1, 0),
    end: const Offset(0, 0),
  ).chain(
    CurveTween(curve: Curves.easeInOut),
  );

  static PageRoute<T> slideX<T>({required Widget child}) {
    /**
        Avoid using Custom Transition for iOS as it already has built-in animation.
        It is preferred to use `CupertinoPageRoute` in the `MaterialPageRoute` to allow
        iOS features, i.e: Back swipe gesture
     */
    if (Platform.isIOS) return _materialPageRoute(child: child);

    return PageRouteBuilder<T>(
      transitionDuration: _duration,
      pageBuilder: (context, anim, anim2) => child,
      transitionsBuilder: (context, anim, anim2, child) {
        return SlideTransition(
          position: anim.drive(_tweenSlide),
          child: child,
        );
      },
    );
  }

  static PageRoute<T> fade<T>({required Widget child}) {
    return PageRouteBuilder<T>(
      pageBuilder: (context, animation, secondaryAnimation) => child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final tween = Tween<double>(begin: 0.0, end: 1.0);

        return FadeTransition(
          opacity: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
