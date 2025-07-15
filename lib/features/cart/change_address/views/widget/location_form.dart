import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:prize/core/utils/generated/tr_locale_keys.g.dart';
import 'package:prize/core/utils/helper/spacing.dart';
import 'package:prize/core/utils/validation/app_validation.dart';
import 'package:prize/features/auth/signup/data/text_field_model.dart';
import 'package:prize/features/auth/signup/view/widgets/custom_text_field_widget.dart';

class LocationForm extends StatefulWidget {
  const LocationForm({super.key});

  @override
  State<LocationForm> createState() => _LocationFormState();
}

class _LocationFormState extends State<LocationForm> {
  final GlobalKey formKay = GlobalKey<FormState>();

  final TextEditingController locationInDetailsController =
      TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKay,
        child: Column(
          children: [
            CustomTextFieldWidget(
              textFieldModel: TextFieldModel(
                title: LocaleKeys.location_screen_location_in_details.tr(),
                hintText: LocaleKeys.location_screen_ex_street_floor.tr(),
                validator: (data) =>
                    AppValidation.locationInDetailsValidation(data!),
                controller: locationInDetailsController,
              ),
            ),
            verticalSpace(20),
            CustomTextFieldWidget(
              textFieldModel: TextFieldModel(
                isPhoneNumber: true,
                title: LocaleKeys.core_phone_number.tr(),
                hintText: "000000",
                validator: (data) => AppValidation.phoneNumberValidation(data!),
                controller: phoneNumberController,
              ),
            ),
          ],
        ));
  }
}
