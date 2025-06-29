part of '../app_dialog.dart';

class _CupertinoDialogBody extends StatelessWidget {
  const _CupertinoDialogBody({
    required this.title,
    required this.description,
    required this.titleColor,
  });

  final String? title;
  final String? description;
  final Color? titleColor;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSize.padding16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 3,
          children: [
            if (title != null)
              Align(
                child: Text(
                  title!,
                  style: context.styleBodyMedium.copyWith(
                    color: titleColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            if (description != null)
              Align(
                child: Text(
                  description!,
                  style: context.styleBodyMedium.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
