import 'dart:io';

import 'package:flutter/material.dart';
import 'package:prize/core/utils/helper/keyboard_dismissible.dart';

class TouchOutsideDismissKeyboard extends StatelessWidget {
  /// #### Used to dismiss keyboard when click outside for iOS
  const TouchOutsideDismissKeyboard({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    if (!Platform.isIOS) return child;

    return GestureDetector(
      onTap: () {
        final currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          KeyboardDismissible.hide(context);
        }
      },
      child: child,
    );
  }
}
