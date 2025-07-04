import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prize/core/constant/app_svgs.dart';
import 'package:prize/core/utils/helper/spacing.dart';
import 'package:prize/core/utils/resources/app_colors.dart';
import 'package:prize/core/widgets/orange_appbar_widget.dart';
import 'package:prize/features/home/view/widgets/user_avatar_widget.dart';
import 'package:prize/features/onboarding/view/widgets/app_submit_button.dart';
import 'package:prize/features/profile/view/widgets/edit_profile_form_field_widget.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final formKey = GlobalKey<FormState>();

  // Controllers
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final bioController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    bioController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: AppSubmitButton(
          onTap: () {},
          title: "Update",
        ),
      ),
      appBar: OrangeAppbarWidget(
        title: "Profile",
        showBackButton: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 10.h,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  UserAvatarWidget(
                    width: 125.w,
                    height: 125.h,
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      width: 40.w,
                      height: 40.h,
                      decoration: BoxDecoration(
                        color: AppColors.darkModeTanOrange,
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.w,
                          vertical: 5.h,
                        ),
                        child: SvgPicture.asset(AppSvgs.edit),
                      ),
                    ),
                  ),
                ],
              ),
              verticalSpace(24),
              EditProfileFormFieldWidget(
                formKey: formKey,
                nameController: nameController,
                phoneController: phoneController,
                emailController: emailController,
                bioController: bioController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
