import 'package:flutter/material.dart';

class AlignCenterStart extends StatelessWidget {
  const AlignCenterStart({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: child,
    );
  }
}
