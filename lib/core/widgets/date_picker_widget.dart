import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:prize/core/utils/extensions/text_style_extension.dart';
import 'package:prize/core/utils/generated/tr_locale_keys.g.dart';
import 'package:prize/core/utils/helper/date_formatter.dart';
import 'package:prize/core/utils/resources/app_colors.dart';
import 'package:prize/core/utils/resources/app_size.dart';

class DatePickerWidget extends StatelessWidget {
  const DatePickerWidget({
    super.key,
    required this.onDateSelected,
    this.initialDate,
    this.firstDate,
    this.lastDate,
    this.enabled = true,
    this.selectableDayPredicate,
    this.initialDatePickerMode = DatePickerMode.day,
    this.showIcon = true,
    this.hint,
  });

  final void Function(DateTime date) onDateSelected;
  final DateTime? initialDate;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final bool enabled;
  final bool Function(DateTime date)? selectableDayPredicate;
  final DatePickerMode initialDatePickerMode;
  final bool showIcon;
  final String? hint;

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    return GestureDetector(
      onTap: enabled
          ? () async {
              DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: initialDate,
                firstDate: firstDate ?? now,
                lastDate: lastDate ?? now.add(const Duration(days: 30)),
                selectableDayPredicate: selectableDayPredicate,
                initialDatePickerMode: initialDatePickerMode,
              );
              if (pickedDate != null) {
                onDateSelected(pickedDate);
              }
            }
          : null,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSize.padding16,
          vertical: AppSize.padding12,
        ),
        margin: const EdgeInsets.only(
          top: AppSize.padding16,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSize.radius16),
          color: enabled ? null : AppColors.greyLighter.withValues(alpha: 0.60),
          border: Border.all(
            color: enabled ? AppColors.grey : AppColors.disabled,
            width: enabled ? 1 : 1.5,
          ),
        ),
        child: Row(
          spacing: AppSize.padding8,
          children: [
            Expanded(
              child: Text(
                initialDate != null
                    ? DateFormatter.stringDateOnly(initialDate!)
                    : hint ?? LocaleKeys.date_choose_date.tr(),
                style: context.styleBodyLarge.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            if (showIcon)
              const Icon(Icons.date_range_rounded, color: AppColors.overlay),
          ],
        ),
      ),
    );
  }

// DateTime? _getInitDate() {
//   if (initialDate == null) {
//     return null;
//   } else if (selectableDayPredicate != null) {
//     var date = initialDate!;
//     bool validDate = false;
//     while (!validDate) {
//       validDate = selectableDayPredicate!.call(date);
//       if(!validDate) {
//         date = date.add(Duration(days: 1));
//       }
//     }
//     return date;
//   }
//   return initialDate;
// }
}
