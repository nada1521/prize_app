import 'package:prize/features/tabs/view/cubit/tabs_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Wrap a screen in the `BottomNavBar` so that if the user goes back,
/// they are redirected to the **HomeScreen** instead of exiting the app.
class HomePopScope extends StatefulWidget {
  const HomePopScope({
    super.key,
    required this.child,
    this.additionalCondition = true,
  });

  final Widget child;

  /// Addition condition to prevent pop due to other condition.
  final bool additionalCondition;

  @override
  State<HomePopScope> createState() => _HomePopScopeState();
}

class _HomePopScopeState extends State<HomePopScope> {
  late final canPop = Navigator.canPop(context);

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: canPop && widget.additionalCondition,
      onPopInvokedWithResult: (didPop, _) {
        if (!canPop && widget.additionalCondition) {
          // navigate to home screen
          context.read<TabsCubit>().updateIndex(0);
        }
      },
      child: widget.child,
    );
  }
}
