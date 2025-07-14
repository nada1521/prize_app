import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:prize/core/utils/generated/tr_locale_keys.g.dart';
import 'package:prize/core/utils/resources/app_colors.dart';
import 'package:prize/core/utils/resources/app_text_styles.dart';

class AddNewAddressTextButton extends StatelessWidget {
  const AddNewAddressTextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Row(
        children: [
          Icon(
            Icons.add,
            color: AppColors.tanOrange,
          ),
          Text(
             LocaleKeys.cart_screen_change_address_new_address_boutt.tr(),
            style: AppTextStyles.meduimBody16W500BlackAndWhiteTitleTextStyle(
                    context)
                .copyWith(
              color: AppColors.tanOrange,
            ),
          ),
        ],
      ),
    );
  }
}
