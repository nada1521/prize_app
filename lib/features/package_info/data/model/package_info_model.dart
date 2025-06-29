import 'package:package_info_plus/package_info_plus.dart';

class PackageInfoModel {
  PackageInfoModel._({
    required this.appName,
    required this.version,
    required this.buildNumber,
    required this.packageName,
    required this.buildSignature,
    this.installerStore,
    this.installTime,
    this.updateTime,
  });

  PackageInfoModel._empty() : this._(
    appName: '',
    version: '',
    buildNumber: '',
    packageName: '',
    buildSignature: '',
  );

  static PackageInfoModel instance = PackageInfoModel._empty();

  static PackageInfoModel _fromPackageInfoPlus(PackageInfo packageInfo) {
    return PackageInfoModel._(
      appName: packageInfo.appName,
      version: packageInfo.version,
      buildNumber: packageInfo.buildNumber,
      packageName: packageInfo.packageName,
      buildSignature: packageInfo.buildSignature,
      installerStore: packageInfo.installerStore,
      installTime: packageInfo.installTime,
      updateTime: packageInfo.updateTime,
    );
  }

  static Future<void> init() async {
    if (instance.version.isNotEmpty) return;

    instance = _fromPackageInfoPlus(await PackageInfo.fromPlatform());
  }

  /// The app name.
  /// `CFBundleDisplayName` on iOS, `application/label` on Android.
  final String appName;

  /// The package name.
  /// `bundleIdentifier` on iOS, `getPackageName` on Android.
  final String packageName;

  /// The package version.
  /// `CFBundleShortVersionString` on iOS, `versionName` on Android.
  final String version;

  /// The build number.
  /// `CFBundleVersion` on iOS, `versionCode` on Android.
  final String buildNumber;

  /// The build signature.
  /// Contains the signing key signature (hex) on Android and empty string on everything else.
  final String buildSignature;

  /// The installer store.
  /// Indicates through which store this application was installed.
  final String? installerStore;

  /// The time when the application was installed.
  ///
  /// - On Android, returns `PackageManager.firstInstallTime`
  /// - On iOS and macOS, return the creation date of the app default `NSDocumentDirectory`
  /// - On Windows and Linux, returns the creation date of the app executable.
  ///   If the creation date is not available, returns the last modified date of the app executable.
  ///   If the last modified date is not available, returns `null`.
  /// - On web, returns `null`.
  final DateTime? installTime;

  /// The time when the application was last updated.
  ///
  /// - On Android, returns `PackageManager.lastUpdateTime`
  /// - On iOS and macOS, return the last modified date of the app main bundle
  /// - On Windows and Linux, returns the last modified date of the app executable.
  ///   If the last modified date is not available, returns `null`.
  /// - On web, returns `null`.
  final DateTime? updateTime;
}
