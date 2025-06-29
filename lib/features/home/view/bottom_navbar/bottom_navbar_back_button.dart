import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:prize/features/home/view/bottom_navbar/logic/bottom_nav_bar_navigator/bottom_nav_bar_navigator_cubit.dart';


class BottomNavbarBackButton extends StatefulWidget {
 const BottomNavbarBackButton({super.key, required this.child, this.enable = false});
  final Widget child;
 final bool? enable;
  @override
  State<BottomNavbarBackButton> createState() => _BottomNavbarBackButtonState();
}

class _BottomNavbarBackButtonState extends State<BottomNavbarBackButton> {
  DateTime? lastPressed;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: widget.enable!
          ? null
          : () async {
              final cubit = context.read<BottomNavBarNavigatorCubit>();
              if (cubit.currentIndex == 2) {
                DateTime now = DateTime.now();
                if (lastPressed == null ||
                    now.difference(lastPressed!) > const Duration(seconds: 2)) {
                  lastPressed = now;
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    Fluttertoast.showToast(
                      msg: "You wont exit",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      backgroundColor: Colors.black,
                      textColor: Colors.white,
                    );
                  });
                } else {
                  SystemNavigator.pop();
                }

                return false;
              } else {
                cubit.goBack();
                return false;
              }
            },
      child: widget.child,
    );
  }
}
