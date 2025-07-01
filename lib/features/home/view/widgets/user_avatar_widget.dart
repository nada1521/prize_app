import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prize/core/constant/app_images.dart';
import 'package:prize/core/utils/resources/app_widget_color.dart';

class UserAvatarWidget extends StatelessWidget {
  const UserAvatarWidget({super.key, this.image, this.width, this.height});
  final ImageProvider<Object>? image;
  final double? width;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 48.w,
      height: height ?? 48.h,
      decoration: BoxDecoration(
        border: GlobalAppWidgetsStyles.containerGrayBoxBorder(context),
        shape: BoxShape.circle,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: image ??
              AssetImage(
                AppImages.userAvatar,
              ),
        ),
      ),
    );
  }
}
