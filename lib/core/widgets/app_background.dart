import 'package:prize/core/widgets/custom_wave_widget.dart';
import 'package:flutter/material.dart';

class AppBackground extends StatelessWidget {
  const AppBackground({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomWaveWidget(),
          Expanded(child: child),
        ],
      ),
    );
  }
}
