part of 'app_dialog.dart';

class DialogButton extends StatelessWidget {
  const DialogButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.color = AppColors.primary,
    this.fit = false,
    this.outlined = false,

    /// ## IOS option
    /// [TRUE] for default action
    this.isCupertinoDefaultAction = false,
  });

  final void Function()? onPressed;
  final String title;
  final Color color;
  final bool fit;
  final bool outlined;
  final bool isCupertinoDefaultAction;

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoDialogAction(
        onPressed: onPressed,
        isDestructiveAction: false,
        isDefaultAction: isCupertinoDefaultAction,
        textStyle: context.styleBodyMedium.copyWith(color: color),
        child: Text(title),
      );
    }

    return AppButton(
      onPressed: onPressed,
      title: title,
      color: color,
      fit: fit,
      outlined: outlined,
      stadiumBorder: false,
      verticalContentPadding: 12,
      horizontalContentPadding: 21,
      fontSize: 14.5,
    );

    // return TextButton(
    //   onPressed: onPressed,
    //   child: Text(title, style: TextStyle(color: color, fontSize: 14.5, fontWeight: FontWeight.w500)),
    // );
  }

  /// Use this ready **CANCEL** button for dialogs.
  static DialogButton cancel({VoidCallback? callback, String? title}) {
    return DialogButton(
      onPressed: () {
        callback?.call();
        NavigatorManager.getContext().pop();
      },
      title: title ?? LocaleKeys.action_cancel.tr(),
      outlined: true,
      color: AppColors.neutral,
    );
  }

  /// Use this ready **OK** button for dialogs.
  static DialogButton ok({VoidCallback? callback, String? title}) {
    return DialogButton(
      onPressed: () {
        callback?.call();
        NavigatorManager.getContext().pop();
      },
      title: title ?? LocaleKeys.action_ok.tr(),
      color: AppColors.primary,
    );
  }
}
