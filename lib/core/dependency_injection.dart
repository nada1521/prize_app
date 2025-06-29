import 'package:prize/core/network/dio_factory.dart';
import 'package:prize/core/utils/helper/cache_helper.dart';
import 'package:prize/features/home/view/bottom_navbar/logic/bottom_nav_bar_navigator/bottom_nav_bar_navigator_cubit.dart';
// import 'package:prize/features/splash/bloc/settings_cubit.dart';
// import 'package:prize/features/splash/data/data_source/settings_api_service.dart';
// import 'package:prize/features/splash/data/repo/settings_repo.dart';
import 'package:prize/features/theme/bloc/theme_cubit.dart';
import 'package:prize/features/theme/data/repo/theme_repo.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

/// Dependency Injection class to register all dependencies
abstract class DI {
  /// DI instance
  static final di = GetIt.instance;

  static Future<void> init() async {
    // base
    final Dio dio = await DioFactory.initDio();
    DI.di.registerLazySingleton<Dio>(() => dio);

    // core
    // DI.di.registerLazySingleton<AuthenticationStatusRepo>(() => AuthenticationStatusRepo());

    // Theme
    _registerModule<ThemeRepo, ThemeCubit, CacheHelper>(
      repo: () => ThemeRepo(),
      cubit: () => ThemeCubit(di()),
    );

    _registerCubitOnly<BottomNavBarNavigatorCubit>(
      () => BottomNavBarNavigatorCubit(),
    );

    // Auth
    // _registerModule<AuthRepo, AuthCubit, AuthLocalDataSource>(
    //   repo: () => AuthRepo(di()),
    //   cubit: () => AuthCubit(di(), di()),
    //   dataSource: () => AuthLocalDataSource(),
    // );

    // login
    // _registerModule<LoginRepository, LoginCubit, LoginRemoteDataSource>(
    //   repo: () => LoginRepository(di()),
    //   cubit: () => LoginCubit(di(), di()),
    //   dataSource: () => LoginRemoteDataSource(di()),
    // );

    // Settings
    // _registerModule<SettingsRepo, SettingsCubit, SettingsApiService>(
    //   repo: () => SettingsRepo(di()),
    //   cubit: () => SettingsCubit(di()),
    //   dataSource: () => SettingsApiService(di()),
    // );

    // banners
    // _registerModule<BannerRepo, BannerCubit, BannerRemoteDataSource>(
    //   repo: () => BannerRepo(di()),
    //   cubit: () => BannerCubit(di()),
    //   dataSource: () => BannerRemoteDataSource(di()),
    // );

    // User profile
    // _registerModule<ProfileRepo, ProfileCubit, ProfileApiService>(
    //   repo: () => ProfileRepo(di()),
    //   cubit: () => ProfileCubit(di()),
    //   dataSource: () => ProfileApiService(di()),
    // );
  }
}

void _registerCubitOnly<Cubit extends Object>(Cubit Function() cubit) {
  DI.di.registerFactory<Cubit>(cubit);
}

void _registerModule<Repo extends Object, Cubit extends Object,
    DataSource extends Object>({
  required Repo Function() repo,
  required Cubit Function() cubit,
  DataSource Function()? dataSource,
}) {
  DI.di.registerLazySingleton<Repo>(repo);
  DI.di.registerFactory<Cubit>(cubit);
  if (dataSource != null) {
    DI.di.registerLazySingleton<DataSource>(dataSource);
  }
}
