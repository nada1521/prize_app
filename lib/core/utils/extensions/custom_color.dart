import 'package:flutter/material.dart';

@immutable
class CustomColors extends ThemeExtension<CustomColors> {
  final Color activeColor;

  const CustomColors({required this.activeColor});

  @override
  CustomColors copyWith({Color? activeColor}) {
    return CustomColors(
      activeColor: activeColor ?? this.activeColor,
    );
  }

  @override
  CustomColors lerp(ThemeExtension<CustomColors>? other, double t) {
    if (other is! CustomColors) return this;
    return CustomColors(
      activeColor: Color.lerp(activeColor, other.activeColor, t)!,
    );
  }
}
