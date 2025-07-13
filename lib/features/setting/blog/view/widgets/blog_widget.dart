import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prize/core/utils/helper/navigation/push_to.dart';
import 'package:prize/core/utils/helper/spacing.dart';
import 'package:prize/core/utils/resources/app_text_styles.dart';
import 'package:prize/core/utils/resources/app_widget_color.dart';
import 'package:prize/features/setting/blog/model/blog_model.dart';
import 'package:prize/features/setting/blog/view/screens/blog_details_screens.dart';

class BlogWidget extends StatelessWidget {
  const BlogWidget({super.key, required this.blog});
  final BlogModel blog;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => pushTo(
          context,
          BlogDetailsScreens(
            blog: blog,
          )),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: AppWidgetColor.fillWidgetByLightBackgroundColor(context),
          borderRadius: BorderRadius.circular(10.r),
        ),
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 151.w,
              height: 151.h,
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
              style: AppTextStyles.headTitle14w500WhiteAndDarkBlueTextStyle(
                      context)
                  .copyWith(
                fontSize: 14,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ],
        ),
      ),
    );
  }
}
