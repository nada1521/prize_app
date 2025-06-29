import 'package:flutter/material.dart';
import 'package:prize/core/utils/resources/app_size.dart';

/// Applied for Android Dialog only.
///
/// iOS Dialog has its default own shape.
class DialogShape extends RoundedRectangleBorder {
  @override
  BorderRadiusGeometry get borderRadius => BorderRadius.circular(AppSize.radius32);
}
