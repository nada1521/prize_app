import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prize/core/utils/generated/tr_locale_keys.g.dart';
import 'package:prize/core/widgets/main/snk_bar.dart';

class DoubleBackToExit extends StatefulWidget {
  const DoubleBackToExit({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<DoubleBackToExit> createState() => _DoubleBackToExitState();
}

class _DoubleBackToExitState extends State<DoubleBackToExit> {
  DateTime timeBackPressed = DateTime.now();
  late final canPop = Navigator.canPop(context);

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: canPop,
      onPopInvokedWithResult: (didPop, _) {
        if (!canPop) {
          final now = DateTime.now();
          final dif = now.difference(timeBackPressed);
          final ifExitWarning = dif > const Duration(seconds: 2);

          timeBackPressed = now;
          if (ifExitWarning) {
            SnkBar.showToastWarning(LocaleKeys.common_message_press_back_again_to_exit.tr());
          } else {
            SnkBar.clearToasts();
            SystemNavigator.pop();
          }
        }
      },
      child: widget.child,
    );
  }
}
