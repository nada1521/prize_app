// import 'package:prize/core/utils/generated/tr_locale_keys.g.dart';
// import 'package:prize/core/utils/resources/app_size.dart';
// import 'package:prize/core/widgets/bottom_sheet/components/app_bottom_sheet_drag_widget.dart';
// import 'package:prize/core/widgets/title/app_title_widget.dart';
// import 'package:prize/core/widgets/selectable_widgets/selectable_icon_option.dart';
// import 'package:prize/features/theme/bloc/theme_cubit.dart';
// import 'package:prize/features/theme/data/extension/theme_mode_x.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class ChangeThemeBottomSheetWidget extends StatelessWidget {
//   const ChangeThemeBottomSheetWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Padding(
//         padding: const EdgeInsets.symmetric(
//           horizontal: AppSize.padding32,
//           vertical: AppSize.paddingDefault20,
//         ),
//         child: BlocBuilder<ThemeCubit, ThemeMode>(
//           builder: (context, state) {
//             return Column(
//               mainAxisSize: MainAxisSize.min,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 AppBottomSheetDragWidget(
//                   padding: const EdgeInsets.only(
//                     top: AppSize.padding5,
//                     bottom: AppSize.padding16,
//                   ),
//                 ),
//                 AppTitleWidget(
//                   title: LocaleKeys.theme_app_theme.tr(),
//                 ),
//                 AppSize.paddingDefault20.spaceHeight,
//                 SelectableIconOption(
//                   title: LocaleKeys.theme_light_mode.tr(),
//                   icon: Icons.light_mode_outlined,
//                   isSelected: state.isLight,
//                   onTap: () {
//                     context.read<ThemeCubit>().changeAppTheme(ThemeMode.light);
//                   },
//                 ),
//                 SelectableIconOption(
//                   title: LocaleKeys.theme_dark_mode.tr(),
//                   icon: Icons.dark_mode_outlined,
//                   isSelected: state.isDark,
//                   onTap: () {
//                     context.read<ThemeCubit>().changeAppTheme(ThemeMode.dark);
//                   },
//                 ),
//                 SelectableIconOption(
//                   title: LocaleKeys.theme_system_mode.tr(),
//                   icon: Icons.brightness_auto_outlined,
//                   isSelected: state.isSystem,
//                   onTap: () {
//                     context.read<ThemeCubit>().changeAppTheme(ThemeMode.system);
//                   },
//                 ),
//               ],
//             );
//           }
//         ),
//       ),
//     );
//   }
// }
