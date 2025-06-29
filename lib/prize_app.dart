import 'package:prize/core/routing/routers.dart';
import 'package:prize/core/utils/constants.dart';
import 'package:prize/core/utils/resources/app_theme.dart';
import 'package:prize/core/routing/app_router.dart';
import 'package:prize/features/theme/bloc/theme_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:prize/features/package_info/data/model/package_info_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/utils/config/touch_outside_to_dismiss_keyboard.dart';
import 'core/utils/helper/navigation/navigation_manager.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return TouchOutsideDismissKeyboard(
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, appTheme) {
          return ScreenUtilInit(
            builder: (context, child) {
              return MaterialApp(
                title: PackageInfoModel.instance.appName,
                navigatorKey: NavigatorManager.navigatorKey,
                theme: AppThemes.light(context.locale.languageCode),
                darkTheme: AppThemes.dark(context.locale.languageCode),
                themeMode: ThemeMode.light,
                debugShowCheckedModeBanner: false,
                localizationsDelegates: context.localizationDelegates,
                supportedLocales: context.supportedLocales,
                locale: context.locale,
                initialRoute:
                    isFirstTimeForUser ? AppRoutes.onBoarding : AppRoutes.login,
                onGenerateRoute: MyRouter.generateRoute,
              );
            },
          );
        },
        buildWhen: (p, c) => p != c,
      ),
    );
  }
}
