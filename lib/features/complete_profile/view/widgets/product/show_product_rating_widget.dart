import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prize/core/utils/helper/spacing.dart';
import 'package:prize/core/constant/app_svgs.dart';

class ShowProductRatingWidget extends StatelessWidget {
  const ShowProductRatingWidget({super.key, required this.rating});

  final String rating;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: 30.h),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(AppSvgs.star),
              horizontalSpace(4),
              Text(
                rating,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          verticalSpace(5),
          Flexible(
            child: Divider(
              height: 1.5,
              thickness: 1.5,
              color: Theme.of(context).colorScheme.outline.withOpacity(.3),
            ),
          ),
        ],
      ),
    );
  }
}
