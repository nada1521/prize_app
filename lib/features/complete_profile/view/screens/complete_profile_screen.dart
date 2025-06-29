import 'package:prize/core/utils/generated/tr_locale_keys.g.dart';
import 'package:prize/core/utils/helper/spacing.dart';
import 'package:prize/core/utils/resources/app_text_styles.dart';
import 'package:prize/core/widgets/app_back_button.dart';
import 'package:prize/features/complete_profile/view/widgets/complete_profile_indicator.dart';
import 'package:prize/features/complete_profile/wishlist/view/widgets/create_wishlist_widget.dart';
import 'package:prize/features/complete_profile/wishlist/view/widgets/sport_wishlist_widget.dart';
import 'package:prize/features/complete_profile/view/widgets/user_data_form_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen>
    with WidgetsBindingObserver {
  final PageController _pageController = PageController();
  int currentPage = 0;
  int maxReachedPage = 0;

  late List<Widget> _pagesData;
  late final List<String> _pageTitles;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    loadLastPageIndex();

    _pagesData = [
      UserDataFormWidget(pageController: _pageController),
      CreateWishlistWidget(pageController: _pageController),
      SportWishlistWidget(pageController: _pageController),
    ];

    _pageTitles = [
      LocaleKeys.complete_profile_appbar_title.tr(),
      LocaleKeys.complete_profile_create_wishlist_widget_appbar_title.tr(),
      LocaleKeys.complete_profile_sport_wishlist_appbar_title.tr(),
    ];

    _pageController.addListener(() async {
      final page = _pageController.page?.round() ?? 0;
      setState(() => currentPage = page);
      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt('complete_profile_page', page);
    });
  }

  Future<void> loadLastPageIndex() async {
    final prefs = await SharedPreferences.getInstance();
    final lastPage = prefs.getInt('complete_profile_page') ?? 0;
    setState(() {
      currentPage = lastPage;
      maxReachedPage = lastPage;
    });
    _pageController.jumpToPage(lastPage);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.detached ||
        state == AppLifecycleState.inactive) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('complete_profile_page');
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _pageTitles[currentPage],
          style: AppTextStyles.appBarHeadTitleTextStyle(context),
        ),
        automaticallyImplyLeading: false,
        leading: AppBackButton(),
        centerTitle: false,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        child: Column(
          children: [
            CompleteProfileIndicator(
              controller: _pageController,
              count: _pagesData.length,
              maxReachedPage: maxReachedPage,
              currentPage: currentPage,
            ),
            verticalSpace(30),
            Expanded(
              flex: 4,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 0.w),
                child: PageView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  controller: _pageController,
                  itemCount: _pagesData.length,
                  itemBuilder: (context, index) {
                    return _pagesData[index];
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
