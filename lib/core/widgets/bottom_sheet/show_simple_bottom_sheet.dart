import 'package:prize/core/utils/extensions/color_extension.dart';
import 'package:flutter/material.dart';
import 'package:prize/core/utils/helper/navigation/navigation_manager.dart';

import 'components/bottom_sheet_shape.dart';
import 'components/custom_bottom_sheet_action.dart';

Future<void> showActionBottomSheet({
  required String title,
  String? subTitle,
  required Widget button,
  bool showCancel = true,
  String? cancelTitle,
}) async {
  return await showModalBottomSheet(
    context: NavigatorManager.getContext(),
    shape: MyBottomSheetShape(),
    isScrollControlled: true,
    backgroundColor: NavigatorManager.getContext().colorWhiteOrNull,
    useSafeArea: true,
    builder: (context) => CustomBottomSheetAction(
      title: title,
      subTitle: subTitle,
      button: button,
      showCancel: showCancel,
      cancelTitle: cancelTitle,
    ),
  );
}
