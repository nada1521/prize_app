import 'dart:async';

import 'package:prize/core/utils/generated/tr_locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:prize/core/utils/helper/navigation/navigation_manager.dart';
import 'package:prize/core/utils/resources/app_colors.dart';
import 'package:prize/core/widgets/dialog/app_dialog.dart';

abstract class LocationHelper {
  static Future<Position?> getPosition({
    void Function()? fallback,
    bool askForPermissionIfDeniedForever = true,
    bool preventDismissible = true,
  }) async {
    Position? position;
    await _checkPermission(
      () async {
        position = await _getPosition();
      },
      askForPermissionIfDeniedForever: askForPermissionIfDeniedForever,
      preventDismissible: preventDismissible,
      fallback: fallback,
    );
    return position;
  }
}

/// Determine the current position of the device.
///
/// When the location services are not enabled or permissions
/// are denied the `Future` will return an error.
Future<Position?> _getPosition() async {
// When we reach here, permissions are granted and we can
// continue accessing the position of the device.
  try {
    return await Geolocator.getCurrentPosition();
  } catch (e) {
    return null;
  }
}

Future<void> _checkPermission(
  void Function() callback, {
  void Function()? fallback,
  bool askForPermissionIfDeniedForever = false,
  bool preventDismissible = true,
}) async {
  LocationPermission permission;
  // just check for permission, if denied -> show dialog and ask for the permission
  permission = await Geolocator.checkPermission();
  debugPrint('> checkPermission - ${permission.name}');

  if (permission == LocationPermission.deniedForever &&
      askForPermissionIfDeniedForever) {
    return await AppDialog.showWarning(
      description: LocaleKeys.location_you_denied_location_permission.tr(),
      icon: Icons.location_on_outlined,
      buttons: [
        DialogButton(
          onPressed: () async {
            Navigator.pop(NavigatorManager.getContext());
            final settingsOpened = await Geolocator.openAppSettings();
            if (settingsOpened) {
              return await _checkPermission(callback);
            }
          },
          title: LocaleKeys.action_ok.tr(),
        ),
      ],
    );
  } else if (permission == LocationPermission.denied) {
    await AppDialog.showWarning(
      description: LocaleKeys.location_ask_for_location_description.tr(),
      icon: Icons.location_on_outlined,
      preventDismissible: preventDismissible,
      buttons: [
        // try again
        DialogButton(
          title: LocaleKeys.action_confirm.tr(),
          onPressed: () async {
            Navigator.pop(NavigatorManager.getContext());
            permission = await Geolocator.requestPermission();
            if (permission == LocationPermission.deniedForever) {
              return await AppDialog.showWarning(
                description:
                    LocaleKeys.location_you_denied_location_permission.tr(),
                icon: Icons.location_on_outlined,
                buttons: [
                  DialogButton(
                    onPressed: () async {
                      final settingsOpened = await Geolocator.openAppSettings();
                      if (settingsOpened) {
                        return await _checkPermission(callback);
                      }
                    },
                    title: LocaleKeys.action_confirm.tr(),
                  ),
                  // cancel
                  DialogButton(
                    onPressed: () async {
                      Navigator.pop(NavigatorManager.getContext());
                    },
                    title: LocaleKeys.action_cancel.tr(),
                    outlined: true,
                    color: AppColors.neutral,
                  ),
                ],
              );
            } else if (permission == LocationPermission.denied) {
              return await _checkPermission(callback);
            } else {
              callback.call();
            }
          },
        ),
        // cancel
        DialogButton(
          onPressed: () async {
            Navigator.pop(NavigatorManager.getContext());
          },
          outlined: true,
          color: AppColors.neutral,
          title: LocaleKeys.action_cancel.tr(),
        ),
      ],
    );
  } else if (permission != LocationPermission.deniedForever) {
    return callback.call();
  }
}
