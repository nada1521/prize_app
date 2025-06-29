import 'package:prize/core/utils/generated/tr_locale_keys.g.dart';
import 'package:prize/core/utils/helper/spacing.dart';
import 'package:prize/core/utils/resources/app_text_styles.dart';
import 'package:prize/core/utils/validation/app_validation.dart';
import 'package:prize/core/widgets/data_picker_icon_widget.dart';
import 'package:prize/features/complete_profile/view/widgets/buttons/next_button_widget.dart';
import 'package:prize/features/complete_profile/view/widgets/upload_image_widget.dart';
import 'package:prize/features/complete_profile/wishlist/view/widgets/who_can_see_wishlist_widget.dart';
import 'package:prize/features/auth/signup/data/text_field_model.dart';
import 'package:prize/features/auth/signup/view/widgets/custom_text_field_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CreateWishlistWidget extends StatelessWidget {
  const CreateWishlistWidget({super.key, required this.pageController});
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    final birthdayController = TextEditingController();
    final eventDateController = TextEditingController();
    final addressController = TextEditingController();
    final descriptionController = TextEditingController();

    return SingleChildScrollView(
      child: Column(
        children: [
          UploadImageWidget(),
          verticalSpace(15),
          CustomTextFieldWidget(
            textFieldModel: TextFieldModel(
              isPhoneNumber: false,
              controller: birthdayController,
              hintText: LocaleKeys
                  .complete_profile_create_wishlist_widget_birthday_placeholder
                  .tr(),
              title: LocaleKeys.complete_profile_create_wishlist_widget_birthday
                  .tr(),
              validator: (color) => AppValidation.favouriteColorValidation(
                color!,
              ),
            ),
          ),
          verticalSpace(15),
          CustomTextFieldWidget(
            textFieldModel: TextFieldModel(
              suffixIcon: DatePickerIconWidget(
                controller: eventDateController,
              ),
              isPhoneNumber: false,
              controller: eventDateController,
              hintText: LocaleKeys
                  .complete_profile_create_wishlist_widget_event_date_placeholder
                  .tr(),
              title: LocaleKeys
                  .complete_profile_create_wishlist_widget_event_date
                  .tr(),
              validator: (color) => AppValidation.favouriteColorValidation(
                color!,
              ),
            ),
          ),
          verticalSpace(15),
          CustomTextFieldWidget(
            textFieldModel: TextFieldModel(
              isPhoneNumber: false,
              controller: addressController,
              hintText: LocaleKeys
                  .complete_profile_create_wishlist_widget_address_in_details_placeholder
                  .tr(),
              title: LocaleKeys
                  .complete_profile_create_wishlist_widget_address_in_details
                  .tr(),
              validator: (color) => AppValidation.favouriteColorValidation(
                color!,
              ),
            ),
            hitText: Text(
              LocaleKeys
                  .complete_profile_create_wishlist_widget_address_in_details_hint_text
                  .tr(),
              style: AppTextStyles.hintTextLightMoreDarkPeriwinkleTextStyle,
            ),
          ),
          verticalSpace(15),
          CustomTextFieldWidget(
            textFieldModel: TextFieldModel(
              maxLines: 3,
              isPhoneNumber: false,
              controller: descriptionController,
              hintText: LocaleKeys
                  .complete_profile_create_wishlist_widget_description_placeholder
                  .tr(),
              title: LocaleKeys
                  .complete_profile_create_wishlist_widget_description
                  .tr(),
              validator: (color) => AppValidation.favouriteColorValidation(
                color!,
              ),
            ),
          ),
          verticalSpace(15),
          WhoCanSeeWishlistWidget(),
          verticalSpace(15),
          NextButtonWidget(
            pageController: pageController,
          ),
        ],
      ),
    );
  }
}
