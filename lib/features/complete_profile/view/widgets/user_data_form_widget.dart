import 'package:prize/core/utils/generated/tr_locale_keys.g.dart';
import 'package:prize/core/utils/helper/spacing.dart';
import 'package:prize/core/utils/validation/app_validation.dart';
import 'package:prize/features/complete_profile/view/widgets/buttons/next_button_widget.dart';
import 'package:prize/features/complete_profile/view/widgets/profile_icon_widget.dart';
import 'package:prize/features/complete_profile/view/widgets/select_size_multi_choise.dart';
import 'package:prize/features/auth/signup/data/text_field_model.dart';
import 'package:prize/features/auth/signup/view/widgets/custom_text_field_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class UserDataFormWidget extends StatelessWidget {
  const UserDataFormWidget({
    super.key,

    required this.pageController
  });
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    final favouriteColorController = TextEditingController();
    final paintsSizeController = TextEditingController();
    final shoesSizeController = TextEditingController();

    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Column(
          children: [
            ProfileDataWidget(),
            verticalSpace(20),
            CustomTextFieldWidget(
              textFieldModel: TextFieldModel(
                isPhoneNumber: false,
                controller: favouriteColorController,
                hintText: LocaleKeys
                    .complete_profile_favourite_color_place_holder
                    .tr(),
                title: LocaleKeys.complete_profile_favourite_color_title.tr(),
                validator: (color) => AppValidation.favouriteColorValidation(
                  color!,
                ),
              ),
            ),
            verticalSpace(20),
            SelectSizeMultiChoise(),
            verticalSpace(20),
            CustomTextFieldWidget(
              textFieldModel: TextFieldModel(
                isPhoneNumber: false,
                controller: paintsSizeController,
                hintText:
                    LocaleKeys.complete_profile_paints_size_place_holder.tr(),
                title: LocaleKeys.complete_profile_paints_size_title.tr(),
                validator: (size) => AppValidation.paintsSizeValidation(
                  size!,
                ),
              ),
            ),
            verticalSpace(20),
            CustomTextFieldWidget(
              textFieldModel: TextFieldModel(
                isPhoneNumber: false,
                controller: shoesSizeController,
                hintText:
                    LocaleKeys.complete_profile_shoes_size_place_holder.tr(),
                title: LocaleKeys.complete_profile_shoes_size_title.tr(),
                validator: (size) => AppValidation.shoesSizeValidation(
                  size!,
                ),
              ),
            ),
            verticalSpace(20),
            NextButtonWidget(
              pageController:pageController ,
            ),
            verticalSpace(20),
          ],
        ),
      ),
    );
  }
}
