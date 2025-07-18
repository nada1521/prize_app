import 'package:flutter/material.dart';
import 'package:prize/core/utils/resources/app_widget_color.dart';


class OverlappingAvatars extends StatelessWidget {
  final List<String> imageUrls;

  const OverlappingAvatars({super.key, required this.imageUrls});

  @override
  Widget build(BuildContext context) {
    const double avatarSize = 36;
    const double overlapOffset = 20.0;

    return SizedBox(
      height: avatarSize,
      child: Stack(
        children: List.generate(imageUrls.length, (index) {
          final int reverseIndex = imageUrls.length - 1 - index;
          return Positioned(
            left: reverseIndex * overlapOffset,
            child: Container(
              width: avatarSize,
              height: avatarSize,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(imageUrls[reverseIndex]),
                  fit: BoxFit.cover,
                ),
                border: Border.all(
                  color: AppWidgetColor.backgroundColor(context),
                  width: 2,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
