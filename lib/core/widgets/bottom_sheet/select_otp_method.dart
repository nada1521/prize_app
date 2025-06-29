import 'package:prize/features/auth/otp/view/widgets/select_otp_method_widget.dart';
import 'package:flutter/material.dart';

Future<void> showSelectOtpMethodBottomSheet(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    builder: (context) {
      return SelectOtpMethodWidget();
    },
  );
}
