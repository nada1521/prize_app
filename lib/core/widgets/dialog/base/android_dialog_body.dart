part of '../app_dialog.dart';

class _AndroidDialogBody extends StatelessWidget {
  const _AndroidDialogBody({
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
        padding: const EdgeInsets.symmetric(
          horizontal: AppSize.padding16,
          vertical: AppSize.padding12,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 3,
          children: [
            const SizedBox(height: AppSize.padding8),
            if (title != null)
              Align(
                child: Text(
                  title!,
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w700,
                    color: titleColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            if (description != null)
              Align(
                child: Text(
                  description!,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
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
