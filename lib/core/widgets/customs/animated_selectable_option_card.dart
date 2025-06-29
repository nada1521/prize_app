import 'package:flutter/material.dart';
import 'package:prize/core/utils/resources/app_colors.dart';
import 'package:prize/core/utils/resources/app_size.dart';

/// A card that animates its background and border when selected.
///
/// Use this widget to display an option with a title that visually
/// indicates selection state via an animated color and border transition.
class AnimatedSelectableOptionCard extends StatelessWidget {
  const AnimatedSelectableOptionCard({
    super.key,
    required this.isSelected,
    this.onTap,
    required this.title,
  });

  final bool isSelected;
  final void Function()? onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(
        end: isSelected ? 1.0 : 0.0,
      ),
      curve: Curves.easeOutQuint,
      duration: const Duration(milliseconds: 600),
      builder: (context, t, _) {
        return InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(AppSize.radiusMax46),
          focusColor: AppColors.primaryLight5,
          highlightColor: AppColors.primaryLight5,
          splashColor: AppColors.primaryLight5,
          hoverColor: AppColors.primaryLight5,
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: AppSize.padding12,
              horizontal: AppSize.padding16,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: Color.lerp(AppColors.secondaryViolet, null, t)!,
              ),
              borderRadius: BorderRadius.circular(AppSize.radiusMax46),
              color: Color.lerp(null, AppColors.primary, t),
            ),
            alignment: Alignment.center,
            child: Text(
              title,
              style: TextStyle(
                fontWeight:
                    FontWeight.lerp(FontWeight.normal, FontWeight.bold, t),
                color: Color.lerp(AppColors.titleBodyLight, Colors.white, t),
              ),
              textAlign: TextAlign.center,
            ),
          ),
        );
      },
    );
  }
}
