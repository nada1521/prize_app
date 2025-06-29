import 'package:cached_network_image/cached_network_image.dart';
import 'package:prize/core/widgets/customs/place_holder_logo.dart';
import 'package:flutter/material.dart';

class AppImageNetwork extends StatelessWidget {
  const AppImageNetwork({
    super.key,
    required this.image,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.cacheHeight = 450,
    this.cacheWidth,
  });

  final String image;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final int? cacheHeight;
  final int? cacheWidth;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: image,
      width: width,
      height: height,
      fit: fit,
      memCacheHeight: cacheHeight,
      memCacheWidth: cacheWidth,
      placeholder: (_, __) => PlaceHolderLogo(height: height, width: width),
      errorWidget: (_, __, ___) => PlaceHolderLogo(height: height, width: width),
    );
  }
}
