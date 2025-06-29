import 'package:flutter/foundation.dart' show kReleaseMode, debugPrint;

/// Prevents debugPrint in release mode.
void preventPrintInRelease() {
  if (kReleaseMode) {
    debugPrint = (String? message, {int? wrapWidth}) {};
  }
}
