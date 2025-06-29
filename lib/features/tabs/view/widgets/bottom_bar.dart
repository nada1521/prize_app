import 'package:prize/core/utils/extensions/color_extension.dart';
import 'package:prize/core/utils/extensions/text_style_extension.dart';
import 'package:prize/core/utils/resources/app_colors.dart';
import 'package:prize/core/utils/resources/app_size.dart';
import 'package:flutter/material.dart';

class CustomBottomBar extends StatelessWidget {
  /// A list of tabs to display, ie `Home`, `Likes`, etc
  final List<CustomBottomBarItem> items;

  /// The tab to display.
  final int currentIndex;

  /// Returns the index of the tab that was tapped.
  final Function(int)? onTap;

  /// The background color of the bar.
  final Color? backgroundColor;

  /// The color of the icon and text when the item is selected.
  final Color? selectedItemColor;

  /// The color of the icon and text when the item is not selected.
  final Color? unselectedItemColor;

  /// The opacity of color of the touchable background when the item is selected.
  final double? selectedColorOpacity;

  /// The border shape of each item.
  final ShapeBorder itemShape;

  /// A convenience field for the margin surrounding the entire widgets.
  final EdgeInsets margin;

  /// The transition duration
  final Duration duration;

  /// The transition curve
  final Curve curve;

  const CustomBottomBar({
    super.key,
    required this.items,
    this.backgroundColor,
    this.currentIndex = 0,
    this.onTap,
    this.selectedItemColor,
    this.unselectedItemColor,
    this.selectedColorOpacity,
    this.itemShape = const StadiumBorder(),
    this.margin = const EdgeInsets.only(
      left: AppSize.paddingDefault20,
      right: AppSize.paddingDefault20,
    ),
    this.duration = const Duration(milliseconds: 1100),
    this.curve = Curves.easeOutQuint,
    // this.duration = const Duration(milliseconds: 350),
    // this.curve = Curves.easeInOut,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      padding: const EdgeInsets.only(
        // left: AppSize.paddingExtraSmall,
        // right: AppSize.paddingExtraSmall,
        top: AppSize.padding12,
        bottom: AppSize.padding12,
      ),
      child: SafeArea(
        minimum: margin,
        child: Row(
          children: List.generate(
            items.length,
            (index) {
              final item = items[index];
              final isSelected = index == currentIndex;
              return TweenAnimationBuilder<double>(
                tween: Tween(
                  end: isSelected ? 1.0 : 0.0,
                ),
                curve: curve,
                duration: duration,
                builder: (context, t, _) {
                  final selectedColor = item.activeColor ??
                      selectedItemColor ??
                      context.colorPrimaryDarkGrey;
                  final unselectedColor = item.unselectedColor ??
                      unselectedItemColor ??
                      AppColors.greyDark;

                  return Expanded(
                    child: GestureDetector(
                      onTap: () => onTap?.call(index),
                      child: Container(
                        color: Colors.transparent,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Icon
                            IconTheme(
                              data: IconThemeData(
                                color: Color.lerp(
                                    unselectedColor, selectedColor, t),
                                size: 24,
                              ),
                              child:
                                  _ItemIcon(isSelected: isSelected, item: item),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              item.title,
                              style: context.styleBodySmall.copyWith(
                                color: Color.lerp(
                                    unselectedColor, selectedColor, t),
                                fontWeight: isSelected
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                                fontSize: 11,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

class _ItemIcon extends StatelessWidget {
  const _ItemIcon({
    required this.isSelected,
    required this.item,
  });

  final bool isSelected;
  final CustomBottomBarItem item;

  @override
  Widget build(BuildContext context) {
    if (isSelected && item.icon.activeIcon != null) {
      return item.icon.activeIcon!;
    }
    return item.icon.icon;
  }
}

/// A tab to display in a [CustomBottomBar]
class CustomBottomBarItem {
  /// The default icon
  final CustomBottomBarIcon icon;

  /// Text to display, ie `Home`
  final String title;

  /// A primary color to use for this tab.
  final Color? activeColor;

  /// The color to display when this tab is not selected.
  final Color? unselectedColor;

  /// The screen to display when this tab is tapped.
  final Widget screen;

  CustomBottomBarItem({
    required this.title,
    required this.icon,
    this.activeColor,
    this.unselectedColor,
    required this.screen,
  });
}

class CustomBottomBarIcon {
  /// Default icon to show.
  final Widget icon;

  /// Show when the tab bar is selected.
  final Widget? activeIcon;

  const CustomBottomBarIcon({
    required this.icon,
    this.activeIcon,
  });
}
