import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prize/core/constant/app_svgs.dart';
import 'package:prize/core/utils/helper/spacing.dart';
import 'package:prize/core/utils/resources/app_colors.dart';
import 'package:prize/core/utils/resources/app_text_styles.dart';
import 'package:prize/core/utils/resources/app_widget_color.dart';
import 'package:prize/core/widgets/app_circular_checkbox.dart';
import 'package:prize/features/cart/change_address/data/models/address_model.dart';

class SavedAddressWidget extends StatefulWidget {
  const SavedAddressWidget({super.key, required this.address});
  final AddressModel address;

  @override
  State<SavedAddressWidget> createState() => _SavedAddressWidgetState();
}

class _SavedAddressWidgetState extends State<SavedAddressWidget> {
  bool isVisible = true;
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isVisible,
      child: Container(
        decoration: BoxDecoration(
          color: AppWidgetColor.fillWidgetByLightBackgroundColor(context),
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: ListTile(
          title: Text(
            widget.address.title,
            style: AppTextStyles.headTitle24w600TextStyle(context).copyWith(
              color: AppColors.lightModeTanOrange,
              fontSize: 14,
            ),
          ),
          leading: AppCircularCheckbox(
            onChanged: (v) {},
            initValue: widget.address.isDefault,
          ),
          dense: true,
          titleAlignment: ListTileTitleAlignment.top,
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(widget.address.body),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SvgPicture.asset(AppSvgs.editSavedLocationIcon),
                  horizontalSpace(12),
                  InkWell(
                      onTap: () {
                        setState(() {
                          isVisible = false;
                        });
                      },
                      child: SvgPicture.asset(AppSvgs.removeTrash)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
