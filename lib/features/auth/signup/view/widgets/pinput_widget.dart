import 'package:prize/core/utils/generated/tr_locale_keys.g.dart';
import 'package:prize/core/utils/resources/app_text_styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:prize/core/utils/resources/app_widget_color.dart';

class FilledRoundedPinPut extends StatefulWidget {
  const FilledRoundedPinPut({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FilledRoundedPinPutState createState() => _FilledRoundedPinPutState();
}

class _FilledRoundedPinPutState extends State<FilledRoundedPinPut> {
  final controller = TextEditingController();
  final focusNode = FocusNode();

  @override
  void dispose() {
    controller.dispose();
    focusNode.dispose();
    super.dispose();
  }

  bool showError = false;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Pinput(
        preFilledWidget: Text('_'),
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        length: 4,
        controller: controller,
        focusNode: focusNode,
        defaultPinTheme: GlobalAppWidgetsStyles.defaultPinTheme(context),
        validator: (value) {
          return value == '2222' ? null : LocaleKeys.auth_otp_wrong_otp.tr();
        },
        onCompleted: (pin) {
          setState(() => showError = pin != '5555');
        },
        focusedPinTheme:
            GlobalAppWidgetsStyles.defaultPinTheme(context).copyWith(
          height: 64,
          width: 64,
          decoration: GlobalAppWidgetsStyles.appFocusedBoxDecoration(context),
        ),
        errorPinTheme: GlobalAppWidgetsStyles.defaultPinTheme(context).copyWith(
          height: 64,
          width: 64,
          decoration: GlobalAppWidgetsStyles.appFocusedBoxDecoration(context),
        ),
        errorTextStyle: AppTextStyles.errorTextTextStyle,
      ),
    );
  }
}
