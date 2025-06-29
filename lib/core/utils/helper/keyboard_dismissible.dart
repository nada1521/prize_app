import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Manage dismiss keyboard
abstract class KeyboardDismissible {
  static void hide(BuildContext context) {
    FocusScope.of(context).unfocus();
    SystemChannels.textInput.invokeMethod('TextInput.hide');
  }
}
