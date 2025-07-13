import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:prize/core/utils/extensions/navigation_extension.dart';
import 'package:prize/core/utils/resources/app_colors.dart';

class ZoomImageWidget extends StatefulWidget {
  const ZoomImageWidget({super.key, required this.imageUrl});
  final String imageUrl;
  @override
  State<ZoomImageWidget> createState() => _ZoomImageWidgetState();
}

class _ZoomImageWidgetState extends State<ZoomImageWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
              onPressed: () {
                context.pop();
              },
              icon: Icon(
                Icons.arrow_back_ios_rounded,
                color: AppColors.darkModeTanOrange,
              )),
        ),
        body: PhotoView(
          backgroundDecoration: const BoxDecoration(),
          imageProvider: CachedNetworkImageProvider(
            widget.imageUrl,
          ),
        ),);
  }
}
