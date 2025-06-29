import 'package:flutter/services.dart';

/// Set Preferred Orientations fot the app
void setAppOrientations() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}
