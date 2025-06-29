import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:prize/core/utils/enums/link_type.dart';
import 'package:prize/core/utils/extensions/navigation_extension.dart';
import 'package:prize/core/utils/generated/tr_locale_keys.g.dart';
import 'package:prize/core/widgets/customs/app_error_message_widget.dart';
import 'package:prize/core/widgets/customs/image_viewer_widget.dart';
import 'package:prize/core/widgets/main/app_image_network.dart';
import 'package:prize/core/widgets/pdf_preview.dart';

class LinkViewerScreen extends StatelessWidget {
  const LinkViewerScreen({
    super.key,
    required this.title,
    required this.url,
    this.errorTitle,
    this.downloadable = true,
  });

  final String url;
  final String title;
  final String? errorTitle;
  final bool downloadable;

  @override
  Widget build(BuildContext context) {
    final linkType = _getLinkType(url);

    if (linkType.isPdf) {
      return PdfPreview(
        title: title,
        downloadable: downloadable,
        errorTitle: errorTitle,
        url: url,
      );
    } else if (linkType.isImage) {
      return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: InkWell(
          onTap: (){
            context.pushToSlideX(
              ImageViewerWidget(heroTag: url, imagePath: url),
            );
          },
          child: Center(
            child: Hero(
              tag: url,
              child: AppImageNetwork(
                image: url,
                fit: BoxFit.contain,
                cacheHeight: null,
              ),
            ),
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
          child: AppErrorMessage(
            message: LocaleKeys.url_could_not_launch_link.tr(),
            iconData: Icons.link_off,
          ),
        ),
      );
    }
  }
}

LinkType _getLinkType(String link) {
  final split = link.split('.');
  if (split.isEmpty) return LinkType.other;
  final extension = split.last;
  return LinkType.fromString(extension);
}
