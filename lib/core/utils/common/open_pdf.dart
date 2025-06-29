
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:prize/core/utils/extensions/navigation_extension.dart';
import 'package:prize/core/utils/generated/tr_locale_keys.g.dart';
import 'package:prize/core/utils/helper/navigation/navigation_manager.dart';
import 'package:prize/core/widgets/customs/link_viewer_screen.dart';
import 'package:prize/core/widgets/dialog/app_dialog.dart';
import 'package:url_launcher/url_launcher_string.dart';

/// **MUST** always call this function to **open** any PDF file into the app.
///
/// This function is reusable in case Error occurred when opening the PDF file
/// when using some package, so it's more flexible to change the implementation.
Future<void> openPdfUrl({
  required String title,
  required String url,
  String? errorTitle,
}) async {
  // getContext().pushToSlideX(
  //   PdfPreview(
  //     title: title,
  //     url: url,
  //     errorTitle: errorTitle,
  //   ),
  // );


  NavigatorManager.getContext().pushToSlideX(
    LinkViewerScreen(
      title: title,
      url: url,
      errorTitle: errorTitle,
    ),
  );



  /*if (Platform.isIOS) {
    getContext().pushToSlideX(
      WebViewScreen(title: title, url: url),
    );
  } else {
    debugPrint('> Trying to open PDF: "$url"');
    if (!await canLaunchUrlString(url)) {
      debugPrint('> Opening PDF: "$url"');
      return AppDialog.showWarning(
        description: errorTitle ?? LocaleKeys.url_could_not_launch_link.tr(),
      );
    }

    await launchUrlString(url);
  }*/
}

Future<void> downloadPdf({
  required String url,
}) async {
  if (!await canLaunchUrlString(url)) {
    debugPrint('> Downloading PDF: "$url"');
    return AppDialog.showWarning(
      description: LocaleKeys.url_could_not_launch_link.tr(),
    );
  }

  await launchUrlString(url);
}
