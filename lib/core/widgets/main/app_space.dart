import 'package:flutter/material.dart';

class AppSpace extends StatelessWidget {
  // ignore: unused_element
  const AppSpace._()
      : height = null,
        width = null;

  const AppSpace.height(this.height, {super.key}) : width = null;

  const AppSpace.width(this.width, {super.key}) : height = null;

  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
    );
  }
}
