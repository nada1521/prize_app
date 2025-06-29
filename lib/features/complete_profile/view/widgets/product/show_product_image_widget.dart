import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prize/core/utils/resources/app_widget_color.dart';
import 'package:prize/features/complete_profile/view/widgets/positioned_widget.dart';

class ShowProductImageWidget extends StatelessWidget {
  const ShowProductImageWidget({
    super.key,
    required this.imageUrl,
    this.height,
    this.maxHeight,
    this.imageScale,
    this.width,
    this.isOffer = false,
  });

  final String imageUrl;
  final double? height, maxHeight, imageScale, width;
  final bool? isOffer;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      constraints:
          maxHeight != null ? BoxConstraints(maxHeight: maxHeight!) : null,
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: Theme.of(context).colorScheme.surface,
      ),
      child: Stack(
        children: [
          Container(
            width: width ?? 200.w,
            decoration: BoxDecoration(
              color: AppWidgetColor.fillWidgetColor(context),
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                scale: imageScale ?? 4,
                // fit: BoxFit.cover,
                image: NetworkImage(
                  imageUrl,
                ),
              ),
            ),
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          ),
          isOffer! ? OfferWidget() : SizedBox()
        ],
      ),
    );
  }
}
