import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prize/features/setting/view/widget/custom_theme_switch_button_widget.dart';
import 'package:prize/features/theme/bloc/theme_cubit.dart';

class ChangeThemeButton extends StatelessWidget {
  const ChangeThemeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, appTheme) {
        return CustomThemeSwitchWidget(
          isDarkMode: appTheme == ThemeMode.dark,
          onChanged: (value) {
            final themeMode = value ? ThemeMode.dark : ThemeMode.light;
            context.read<ThemeCubit>().changeAppTheme(themeMode);
          },
        );
      },
    );
  }
}
