// ignore_for_file: depend_on_referenced_packages

import 'dart:async';
import 'dart:io';
import 'package:prize/core/utils/extensions/color_extension.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:prize/core/utils/extensions/navigation_extension.dart';
import 'package:prize/core/utils/resources/app_colors.dart';
import 'package:prize/core/utils/resources/app_size.dart';
import 'package:prize/core/widgets/bottom_sheet/components/app_bottom_sheet_drag_widget.dart';
import 'package:prize/core/widgets/bottom_sheet/show_custom_bottom_sheet.dart';
import 'package:prize/core/widgets/main/app_button.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:prize/core/utils/generated/tr_locale_keys.g.dart';
import 'package:prize/core/widgets/dialog/app_dialog.dart';
import 'package:permission_handler/permission_handler.dart';

import 'navigation/navigation_manager.dart';

/// This class is responsible for handling the image picking processes.
///
/// i.e: camera, gallery, handling the permissions and the image compression.
abstract class ImagePickerManager {
  /// This method checks the permissions first and handling with it then executes
  /// the [callback] if permission granted.
  static Future<void> checkPermission({
    required FutureOr Function() callback,
  }) async {
    final permission = await Permission.camera.request();

    if (permission.isGranted) {
      return await callback();
    } else if (permission.isPermanentlyDenied) {
      await AppDialog.showWarning(
        description: LocaleKeys.image_you_denied_camera_permission.tr(),
        icon: Icons.camera_alt_outlined,
        buttons: [
          DialogButton(
            onPressed: () async {
              Navigator.pop(NavigatorManager.getContext());
              openAppSettings();
            },
            title: LocaleKeys.action_ok.tr(),
          ),
        ],
      );
    } else {
      await AppDialog.showWarning(
        description: LocaleKeys.image_please_allow_camera_permission.tr(),
        icon: Icons.camera_alt_outlined,
        buttons: [
          DialogButton(
            onPressed: () async {
              Navigator.pop(NavigatorManager.navigatorKey.currentContext!);
              return await callback();
            },
            title: LocaleKeys.action_ok.tr(),
          ),
          DialogButton(
            onPressed: () async {
              Navigator.pop(NavigatorManager.navigatorKey.currentContext!);
            },
            title: LocaleKeys.action_cancel.tr(),
          ),
        ],
      );
    }
  }

  /// Show bottom sheet to pick image
  static Future<void> onPickImage({
    required FutureOr Function() onGallery,
    required FutureOr Function() onCamera,
  }) async {
    return await showCustomBottomSheet(
      builder: (context) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSize.padding32,
              vertical: AppSize.paddingDefault20,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: AppSize.padding16,
              children: [
                AppBottomSheetDragWidget(
                  padding: const EdgeInsets.symmetric(
                    vertical: AppSize.padding5,
                  ),
                ),
                AppButton(
                  title: LocaleKeys.image_upload_image.tr(),
                  icon: Icon(
                    Icons.photo_outlined,
                    color: context.colorPrimaryWhite,
                  ),
                  outlined: true,
                  color: context.colorPrimaryWhite,
                  onPressed: () {
                    context.pop();
                    checkPermission(callback: onGallery);
                  },
                ),
                AppButton(
                  title: LocaleKeys.image_pick_image_camera.tr(),
                  color: context.colorPrimaryWhite,
                  icon: Icon(
                    Icons.camera_alt_outlined,
                    color: context.colorPrimaryWhite,
                  ),
                  outlined: true,
                  onPressed: () {
                    context.pop();
                    checkPermission(callback: onCamera);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static Future<File> compress({
    required File file,
    int maxSizeKB = 2020,
  }) async {
    int quality = 100;
    const reducePercentage = 10;
    const minQuality = 6;
    File? compressedFile;

    // Get the original file name and add "compressed"
    final Directory tempDir = await getTemporaryDirectory();
    final String originalFileName = path.basenameWithoutExtension(file.path);
    final String targetFileName = '${originalFileName}_compressed.jpg';
    final String targetPath = path.join(tempDir.path, targetFileName);
    final fileSize = file.lengthSync() ~/ 1024;
    debugPrint('> Image size (ORIGINAL): $fileSize KB');

    do {
      if (fileSize <= maxSizeKB) return file;

      final cmpFile = await FlutterImageCompress.compressAndGetFile(
        file.path,
        targetPath,
        quality: quality,
      );

      if (cmpFile == null) break;

      compressedFile = File(cmpFile.path);
      final fileSizeKB = compressedFile.lengthSync() ~/ 1024;
      debugPrint('> image size: $fileSizeKB KB | quality: $quality');

      if (fileSizeKB <= maxSizeKB) {
        break;
      } else if (quality <= 20) {
        quality -= 5;
      } else {
        quality -= reducePercentage;
      }
    } while (quality > minQuality);

    final newFileSize = compressedFile!.lengthSync() ~/ 1024;
    debugPrint('> Done compressed image size: $newFileSize KB');

    return compressedFile;
  }

  static Future<File?> cropImage(File file) async {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: file.path,
      aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
      compressFormat: ImageCompressFormat.png,
      maxHeight: 512,
      maxWidth: 512,
      uiSettings: [
        AndroidUiSettings(
          toolbarColor: AppColors.primary,
          cropStyle: CropStyle.circle,
          toolbarTitle: LocaleKeys.image_edit_image.tr(),
          lockAspectRatio: true,
          toolbarWidgetColor: AppColors.onPrimaryColor,
          aspectRatioPresets: [
            CropAspectRatioPreset.square,
          ],
        ),
        IOSUiSettings(
          aspectRatioLockEnabled: true,
          resetAspectRatioEnabled: false,
          cropStyle: CropStyle.rectangle,
          title: LocaleKeys.image_edit_image.tr(),
          aspectRatioLockDimensionSwapEnabled: true,
          aspectRatioPickerButtonHidden: true,
          aspectRatioPresets: [
            CropAspectRatioPreset.square,
          ],
        ),
      ],
    );

    return croppedFile == null ? null : File(croppedFile.path);
  }
}
