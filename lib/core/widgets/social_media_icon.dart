import 'package:flutter/material.dart';
import 'package:prize/core/utils/resources/app_size.dart';
import 'package:url_launcher/url_launcher_string.dart';

class SocialMediaIcon extends StatelessWidget {
  const SocialMediaIcon({
    super.key,
    required this.url,
    required this.assetImage,
    this.size = 30,

    /// Checks user authentication before opening the url.
    ///
    /// Defaults to [True]
    this.checkAuthToOpen = true,
  });

  final String url;
  final String assetImage;
  final double size;
  final bool checkAuthToOpen;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        if (checkAuthToOpen) {
          // checkAuthCallback(() async {
          //   await launchUrlString(url);
          // });
        } else {
          await launchUrlString(url);
        }
      },
      borderRadius: BorderRadius.circular(AppSize.radiusSmall8 + 1),
      child: Container(
        height: size,
        width: size,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSize.radiusSmall8 + 1),
          color: Colors.white,
          image: DecorationImage(image: AssetImage(assetImage), fit: BoxFit.cover),
        ),
      ),
    );
  }
}
