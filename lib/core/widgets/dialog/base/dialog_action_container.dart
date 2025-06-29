part of '../app_dialog.dart';

/// Applied for Android Dialog only.
///
/// iOS Dialog has its default own shape.
class _DialogActionContainer extends StatelessWidget {
  const _DialogActionContainer({required this.buttons});

  final List<DialogButton> buttons;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(
        horizontal: AppSize.padding16,
      ),
      child: Center(
        child: Wrap(
          spacing: 5,
          children: buttons,
        ),
      ),
    );
  }
}
