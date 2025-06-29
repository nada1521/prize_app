part of '../app_dialog.dart';

class _DialogAnimatedIcon extends StatelessWidget {
  const _DialogAnimatedIcon({required this.icon, required this.color}) : isAndroid = false;

  const _DialogAnimatedIcon.android({required this.icon}) : isAndroid = true, color = Colors.white;

  final IconData? icon;
  final Color? color;
  final bool isAndroid;

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      size: isAndroid ? 40 : 36,
      color: color,
    ).animate().shake(delay: 300.milliseconds, offset: const Offset(4, 1), rotation: 0.2);
  }
}
