import 'package:flutter/material.dart';
import 'package:prize/core/utils/helper/navigation/navigation_manager.dart';

import 'components/bottom_sheet_shape.dart';

Future<void> showCustomBottomSheet({
  required Widget Function(BuildContext context) builder,
}) async {
  return await showModalBottomSheet(
    context: NavigatorManager.getContext(),
    shape: MyBottomSheetShape(),
    isScrollControlled: true,
    // backgroundColor: context.getWhiteOrNull,
    useSafeArea: true,
    builder: builder,
  );
}
