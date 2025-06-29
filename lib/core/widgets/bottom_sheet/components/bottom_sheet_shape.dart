import 'package:flutter/cupertino.dart';

class MyBottomSheetShape extends RoundedRectangleBorder {
  @override
  BorderRadiusGeometry get borderRadius => const BorderRadius.vertical(
        top: Radius.circular(40),
      );
}
