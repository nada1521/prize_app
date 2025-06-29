part of '../app_dialog.dart';

class _DialogAndroidIconContainer extends StatelessWidget {
  const _DialogAndroidIconContainer({required this.child, required this.backgroundColor});

  final Widget child;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: AppSize.paddingDefault20, horizontal: AppSize.padding12),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: const BorderRadius.only(topRight: Radius.circular(AppSize.radius32), topLeft: Radius.circular(AppSize.radius32)),
      ),
    );
  }
}
