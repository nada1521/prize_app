import 'package:prize/core/constant/app_images.dart';
import 'package:prize/core/utils/constants.dart';
import 'package:prize/core/utils/generated/tr_locale_keys.g.dart';
import 'package:prize/core/utils/helper/navigation/push_replacement.dart';
import 'package:prize/core/utils/helper/spacing.dart';
import 'package:prize/features/onboarding/view/widgets/build_onboarding_page_widget.dart';
import 'package:prize/features/onboarding/view/widgets/custom_page_indicator.dart';
import 'package:prize/features/onboarding/view/widgets/app_submit_button.dart';
import 'package:prize/features/onboarding/data/models/onboarding_page_data_model.dart';
import 'package:prize/features/onboarding/view/widgets/skipe_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../auth/signup/view/screens/signup_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  late final List<OnboardingPageDataModel> _pagesData = [];

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page?.round() ?? 0;
      });
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (_pagesData.isNotEmpty) return;

    final isDark = Theme.of(context).brightness == Brightness.dark;

    _pagesData.addAll([
      OnboardingPageDataModel(
        image: isDark
            ? AppImages.onboardingImageOneDarkMode
            : AppImages.onboardingImageOne,
        title: LocaleKeys.on_boarding_title_1.tr(),
        description: LocaleKeys.on_boarding_subtitle_1.tr(),
      ),
      OnboardingPageDataModel(
        image: isDark
            ? AppImages.onboardingImageTwoDarkMode
            : AppImages.onboardingImageTwo,
        title: LocaleKeys.on_boarding_title_2.tr(),
        description: LocaleKeys.on_boarding_subtitle_2.tr(),
      ),
      OnboardingPageDataModel(
        image: isDark
            ? AppImages.onboardingImageThreeDarkMode
            : AppImages.onboardingImageThree,
        title: LocaleKeys.on_boarding_title_3.tr(),
        description: LocaleKeys.on_boarding_subtitle_3.tr(),
      ),
    ]);
  }

  void updatePagesData(List<OnboardingPageDataModel> newPagesData) {
    setState(() {
      _pagesData.clear();
      _pagesData.addAll(newPagesData);
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          SkipeButton(),
        ],
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: _pagesData.length,
            itemBuilder: (context, index) {
              return BuildOnboardingPageWidget(
                pageData: _pagesData[index],
                controller: _pageController,
                pagescount: _pagesData.length,
              );
            },
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomPageIndicator(
                  controller: _pageController,
                  count: _pagesData.length,
                ),
                verticalSpace(20),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 5.h),
                  child: AppSubmitButton(
                    height: 50.h,
                    onTap: () {
                      if (_currentPage < _pagesData.length - 1) {
                        _pageController.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      } else {
                        pushReplacement(context, SignupScreen());
                        tologFirstTimeChecker(isFirstTime: false);
                      }
                    },
                    title: _currentPage == _pagesData.length - 1
                        ? LocaleKeys.on_boarding_get_started.tr()
                        : LocaleKeys.on_boarding_next.tr(),
                    width: double.infinity,
                  ),
                ),
                verticalSpace(5),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
