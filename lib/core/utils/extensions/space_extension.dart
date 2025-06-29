import 'package:flutter/material.dart';

extension SpaceIntExtension on num {
  Widget get spaceWidth => SizedBox(width: toDouble());
  Widget get spaceHeight => SizedBox(height: toDouble());
}
