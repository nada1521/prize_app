import 'package:flutter/material.dart';

import 'package:prize/features/setting/point/view/widgets/appbar_and_current_widget.dart';
import 'package:prize/features/setting/point/view/widgets/point_tap_bar.dart';

class PointScreen extends StatelessWidget {
  const PointScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppBarAndCurrentPointWidget(),
          Expanded(child: PointTabBar()),
        ],
      ),
    );
  }
}
