import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prize/core/constant/app_svgs.dart';
import 'package:prize/core/utils/constants.dart';
import 'package:prize/core/utils/extensions/navigation_extension.dart';
import 'package:prize/core/utils/generated/tr_locale_keys.g.dart';
import 'package:prize/core/utils/helper/spacing.dart';
import 'package:prize/core/utils/resources/app_text_styles.dart';
import 'package:prize/core/utils/resources/app_widget_color.dart';
import 'package:prize/core/utils/validation/app_validation.dart';
import 'package:prize/core/widgets/app_fill_background_button.dart';
import 'package:prize/core/widgets/app_outline_button.dart';
import 'package:prize/features/auth/signup/data/text_field_model.dart';
import 'package:prize/features/auth/signup/view/widgets/custom_text_field_widget.dart';

class RateWidget extends StatefulWidget {
  const RateWidget({super.key});

  @override
  State<RateWidget> createState() => _RateWidgetState();
}

class _RateWidgetState extends State<RateWidget> {
  int selectedStars = 0;
  final TextEditingController bioController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final TextFieldModel textFieldModel = TextFieldModel(
      isPassword: false,
      controller: bioController,
      hintText: "FCIS .. CS Dept \n UI/UX Designer",
      title: LocaleKeys.setting_screen_info_settings_items_bio.tr(),
      validator: AppValidation.bioValidation,
      maxLines: 3,
    );

    return Container(
      padding: screensPadding,
      decoration: BoxDecoration(
        color: AppWidgetColor.fillWidgetColor(context),
        borderRadius: BorderRadius.circular(32.r),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Title
          Text(
            "Rate",
            style: AppTextStyles.headTitle24w600TextStyle(context),
          ),
          verticalSpace(24),

          // ⭐ Stars
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(5, (index) {
              final isSelected = index < selectedStars;
              return InkWell(
                onTap: () {
                  setState(() {
                    selectedStars = index + 1;
                  });
                },
                child: SvgPicture.asset(
                  isSelected ? AppSvgs.fillColorStarIcon : AppSvgs.rateStarIcon,
                  width: 48.w,
                  height: 48.h,
                  // color: isSelected ? Colors.orange : Colors.grey[300],
                ),
              );
            }),
          ),

          verticalSpace(24),

          CustomTextFieldWidget(
            textFieldModel: textFieldModel,
          ),
          verticalSpace(24),

          Row(
            children: [
              Expanded(
                child: AppOutLineButton(
                  onTap: () {
                    context.pop();
                  },
                  title: "Cancel",
                ),
              ),
              horizontalSpace(12),
              Expanded(
                child: AppFillBckgroundButton(
                  onTap: () {
                    context.pop();
                  },
                  title: "Send",
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
