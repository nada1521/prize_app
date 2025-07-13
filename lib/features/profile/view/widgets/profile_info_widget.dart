import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prize/core/constant/app_svgs.dart';
import 'package:prize/core/utils/generated/tr_locale_keys.g.dart';
import 'package:prize/core/utils/helper/navigation/push_to.dart';
import 'package:prize/core/utils/helper/spacing.dart';
import 'package:prize/core/utils/resources/app_widget_color.dart';
import 'package:prize/features/home/view/widgets/user_avatar_widget.dart';
import 'package:prize/features/profile/view/screen/edit_profile_screen.dart';
import 'package:prize/features/profile/view/widgets/Bio_widget.dart';
import 'package:prize/features/profile/view/widgets/action_botton_widget.dart';
import 'package:prize/features/profile/view/widgets/comming_event_widget.dart';
import 'package:prize/features/profile/view/widgets/personal_sizes.dart';
import 'package:prize/features/profile/view/widgets/user_info_widget.dart';
import 'package:share_plus/share_plus.dart';

class ProfileInfoWidget extends StatelessWidget {
  const ProfileInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height / 1.8;
    return SliverAppBar(
      toolbarHeight: 0,
      pinned: false,
      automaticallyImplyLeading: false,
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(height),
        child: Container(
          constraints: BoxConstraints(
            maxHeight: height,
          ),
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
          color: AppWidgetColor.fillWidgetWithOrangeAndDarkColor(context),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    UserAvatarWidget(
                      width: 80.w,
                      height: 80.h,
                    ),
                    horizontalSpace(12),
                    UserInfoWidget()
                  ],
                ),
              ),
              BioWidget(),
              verticalSpace(18),
              Expanded(flex: 2, child: PersonalSizes()),
              verticalSpace(10),
              Expanded(child: CommingEventWidget()),
              verticalSpace(10),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: ActionBottonWidget(
                        onTap: () {
                          pushTo(context, EditProfileScreen());
                        },
                        iconPath: AppSvgs.editPrfileIconButton,
                        title: LocaleKeys.profile_screen_edit_profile.tr(),
                      ),
                    ),
                    horizontalSpace(10),
                    Expanded(
                      child: ActionBottonWidget(
                        onTap: () {
                          Share.share("profile");
                        },
                        iconPath: AppSvgs.shareProfileIconButton,
                        title: LocaleKeys.profile_screen_share_profile.tr(),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
