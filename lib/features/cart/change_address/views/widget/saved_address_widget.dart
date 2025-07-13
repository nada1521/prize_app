import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prize/core/utils/resources/app_colors.dart';
import 'package:prize/core/utils/resources/app_text_styles.dart';
import 'package:prize/core/utils/resources/app_widget_color.dart';
import 'package:prize/core/widgets/app_circular_checkbox.dart';
import 'package:prize/features/cart/change_address/data/models/address_model.dart';

class SavedAddressWidget extends StatelessWidget {
  const SavedAddressWidget({super.key, required this.address});
  final AddressModel address;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppWidgetColor.fillWidgetByLightBackgroundColor(context),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: ListTile(
        title: Text(
          address.title,
          style: AppTextStyles.headTitle24w600TextStyle(context).copyWith(
            color: AppColors.lightModeTanOrange,
            fontSize: 14,
          ),
        ),
        leading: AppCircularCheckbox(onChanged: (v) {}),
        dense: true,
        titleAlignment: ListTileTitleAlignment.top,
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(address.body),
            Row(
              children: [Icon(Icons.accessibility_new_sharp)],
            )
          ],
        ),
      ),
    );
  }
}
