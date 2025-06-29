import 'package:prize/core/utils/constants.dart';
import 'package:prize/features/theme/bloc/theme_cubit.dart';
import 'package:flutter/foundation.dart';
import 'package:prize/core/dependency_injection.dart';
import 'package:prize/core/utils/common/bloc_observer.dart';
import 'package:prize/core/utils/common/languages.dart';
import 'package:prize/core/utils/helper/cache_helper.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:internet_state_manager/internet_state_manager.dart';
import 'package:prize/core/utils/config/prevent_debug_print.dart';
import 'package:requests_inspector/requests_inspector.dart';
import 'core/utils/common/set_system_orientation.dart';
import 'core/utils/config/setup_timeago_locales.dart';
import 'features/package_info/data/model/package_info_model.dart'
    show PackageInfoModel;
import 'prize_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // [SECURITY] Prevent debug print in release mode
  preventPrintInRelease();
  // Setup .env for environment variables
  await dotenv.load(fileName: ".env");

  await Future.wait([
    // Init easy localization
    EasyLocalization.ensureInitialized(),
    // Init Dependency Injection (DI)
    DI.init(),
    // Init cache helper for local storage
    CacheHelper.init(),
    // Init app package info singleton instance
    PackageInfoModel.init(),
  ]);
 
  // Check if user open app first time
  checkFirstTimeChecker();
  // Set bloc observer to log bloc events
  setupBlocObserver();

  setAppOrientations();

  // Setup time ago locales
  setupTimeAgoLocales();

  runApp(
    
    EasyLocalization(
      supportedLocales: Language.locales,
      path: 'assets/translations',
      ignorePluralRules: false,
      child: InternetStateManagerInitializer.init(
        options: InternetStateOptions(
          autoCheckConnection: false,
          checkConnectionTimeout: const Duration(seconds: 5),
        ),
        child: MultiBlocProvider(
          providers: [
            // BlocProvider(create: (context) => DI.di<AuthCubit>(), lazy: false),
            // BlocProvider(create: (context) => DI.di<SettingsCubit>()),
            BlocProvider(
                create: (context) => DI.di<ThemeCubit>()..getAppTheme(),
                lazy: false),
          ],
          child: RequestsInspector(
            enabled: kDebugMode,
            hideInspectorBanner: true,
            showInspectorOn: ShowInspectorOn.Shaking,
            child: const MyApp(),
          ),
        ),
      ),
    ),

  );
}

