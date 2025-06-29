import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:prize/core/utils/common/open_pdf.dart';
import 'package:prize/core/utils/generated/tr_locale_keys.g.dart';
import 'package:prize/core/utils/resources/app_colors.dart';
import 'package:prize/core/widgets/customs/app_error_message_widget.dart';
import 'package:prize/core/widgets/main/app_circular_progress.dart';

class PdfPreview extends StatelessWidget {
  const PdfPreview(
      {super.key,
      required this.title,
      required this.url,
      this.errorTitle,
      this.downloadable = true});

  final String url;
  final String title;
  final String? errorTitle;
  final bool downloadable;

  String getUrl() {
    return url;
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('> open pdf: "$url"');
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          if (downloadable)
            Padding(
              padding: const EdgeInsetsDirectional.only(end: 16),
              child: IconButton(
                icon: Icon(Icons.download, color: AppColors.greyDarker),
                tooltip: LocaleKeys.url_cannot_open_pdf_error.tr(),
                onPressed: () {
                  downloadPdf(url: url);
                },
              ),
            ),
        ],
      ),
      body: PDF(
        onError: (error) {
          debugPrint("> Error occurred when open PDF '$url': $error");
          if (kDebugMode) throw error;
        },
      ).fromUrl(
        getUrl(),
        placeholder: (progress) => const AppCircularProgress(),
        errorWidget: (error) => AppErrorMessage(
            message: errorTitle ?? LocaleKeys.url_could_not_launch_link.tr(),
            iconData: Icons.link_off),
      ),
    );
  }
}
