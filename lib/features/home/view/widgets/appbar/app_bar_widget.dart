import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prize/core/utils/helper/spacing.dart';
import 'package:prize/core/utils/resources/app_widget_color.dart';
import 'package:prize/features/home/view/widgets/appbar/search_widget.dart';
import 'package:prize/features/home/view/widgets/appbar/show_user_info_widget.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      toolbarHeight: 0,
      pinned: true,
      automaticallyImplyLeading: false,
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(150.h),
        child: Container(
          constraints: BoxConstraints(
            maxHeight: 150.h,
          ),
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
          color: AppWidgetColor.fillWidgetWithOrangeAndDarkColor(context),
          child: Column(
            children: [
              verticalSpace(10),
              ShowUserInfoWidget(),
              Spacer(),
              SearchWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
