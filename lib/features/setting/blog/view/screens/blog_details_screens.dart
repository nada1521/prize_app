// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:prize/core/constant/app_svgs.dart';
import 'package:prize/core/utils/constants.dart';
import 'package:prize/core/utils/helper/spacing.dart';
import 'package:prize/core/utils/resources/app_circular_icon_button.dart';
import 'package:prize/core/utils/resources/app_text_styles.dart';
import 'package:prize/core/widgets/app_outline_button.dart';
import 'package:prize/core/widgets/orange_appbar_widget.dart';
import 'package:prize/features/complete_profile/view/widgets/product/show_product_image_widget.dart';
import 'package:prize/features/setting/blog/model/blog_model.dart';

class BlogDetailsScreens extends StatelessWidget {
  const BlogDetailsScreens({
    super.key,
    required this.blog,
  });

  final BlogModel blog;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OrangeAppbarWidget(
        title: "Blog Details",
        showBackButton: true,
        suffixIcon:
            AppCircularIconButton(iconPath: AppSvgs.shareProfileIconButton),
      ),
      body: ListView(
        shrinkWrap: true,
        padding: screensPadding,
        children: [
          Container(
            height: 242.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              image: DecorationImage(
                image: NetworkImage(
                  blog.imageUrl,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          verticalSpace(10),
          Text(
            blog.puplishDate,
            style:
                AppTextStyles.smallBodyTitle12w500TextStyle(context).copyWith(
              fontSize: 12,
            ),
          ),
          verticalSpace(10),
          Text(
            blog.headTitle,
            style:
                AppTextStyles.headTitle14w500WhiteAndDarkBlueTextStyle(context)
                    .copyWith(
              fontSize: 18,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
          ),
          verticalSpace(10),
          Text(
            blog.bodyTitle,
            style:
                AppTextStyles.smallBodyTitle12w500TextStyle(context).copyWith(
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
