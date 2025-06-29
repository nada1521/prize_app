import 'package:prize/core/utils/common/system_overlay_style.dart';
import 'package:prize/core/utils/extensions/custom_color.dart';
import 'package:prize/core/utils/resources/app_colors.dart';
import 'package:prize/core/utils/resources/app_font_family.dart';
import 'package:prize/core/utils/resources/app_size.dart';
import 'package:flutter/material.dart';

abstract class AppThemes {
  static const _inputRadius =
      BorderRadius.all(Radius.circular(AppSize.radiusMax46));

  static ThemeData light(String languageCode) => ThemeData(
        // material 3
        useMaterial3: true,

        /// main colors
        primaryColor: AppColors.primary,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
          brightness: Brightness.light,
          secondary: AppColors.secondDarkBlue,
          onSecondary: AppColors.darkButton,

          tertiary: AppColors.darkBlue,
          primary: AppColors.primary,
          onPrimary: AppColors.primary,
          // outline: AppColors.darkButtonBorder,
          surface: AppColors.white,
          onSurface: AppColors.white,
          error: AppColors.errorColor,

          // error: AppColor.redColor,
          outline: AppColors.greyLighter,
        ),
        primarySwatch: AppColors.primarySwatch,
        // scaffoldBackgroundColor: Color(0xFFF7F9FF),
        // colorScheme: ColorScheme.fromSeed(
        //   seedColor: AppColors.primaryDarkMode,
        //   brightness: Brightness.dark,
        //   secondary: AppColors.white,
        //   tertiary: AppColors.moreLighterDarkPeriwinkleDarkMode,
        //   primary: AppColors.primaryDarkMode,
        //   onPrimary: AppColors.primary,
        // ),

        extensions: [
          CustomColors(activeColor: AppColors.activeColor),
        ],

        /// font family
        fontFamily: languageCode == 'ar' ? FontFamily.ibm : FontFamily.poppins,

        //scaffolod
        scaffoldBackgroundColor: AppColors.primaryWhite,
        dialogTheme: DialogThemeData(
          backgroundColor: AppColors.secondryWhite,
        ),

        /// appBar theme
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          scrolledUnderElevation: 0,
          elevation: 0,
          systemOverlayStyle: kSystemOverlayStyle,
          backgroundColor: AppColors.primaryWhite,
        ),

        /// button theme
        buttonTheme: const ButtonThemeData(
          shape: StadiumBorder(),
          buttonColor: AppColors.primaryDark20,
        ),

        disabledColor: AppColors.disabled,

        /// Text Style
        textTheme: const TextTheme(
          /// The default text style for [Material].
          bodyMedium: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: AppColors.secondDarkBlue,
          ),

          headlineLarge: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w700,
            color: AppColors.headline,
          ),

          headlineMedium: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            // color: AppColor.headline,
          ),

          // headlineSmall: TextStyle(
          //   fontSize: 18,
          //   fontWeight: FontWeight.w600,
          //   color: AppColor.headline,
          // ),

          /// Used for [Label] in [TextField] widget
          titleMedium: TextStyle(
            fontSize: 16,
            color: AppColors.titleBody,
          ),

          /// Used for [Text] in [TextField] widget
          bodyLarge: TextStyle(
            fontSize: 15,
            color: AppColors.title,
            height: 1.4,
          ),

          /// Body Small - 13
          bodySmall: TextStyle(
            fontSize: 12,
            color: AppColors.titleBodyLight,
            height: 1.4,
          ),
        ),

        iconTheme: const IconThemeData(
          color: AppColors.greyDarker,
        ),

        dividerTheme: const DividerThemeData(
          color: AppColors.greyLight,
        ),

        /// input decoration theme
        inputDecorationTheme: const InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
            borderRadius: _inputRadius,
            borderSide: BorderSide(
              color: AppColors.greyLighter,
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: _inputRadius,
            borderSide: BorderSide(
              color: AppColors.greyLighter,
              width: 1.5,
            ),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.primaryDark40),
            borderRadius: _inputRadius,
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: _inputRadius,
            borderSide: BorderSide(
              color: AppColors.redColor,
              width: 1,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: _inputRadius,
            borderSide: BorderSide(
              color: AppColors.redColor,
              width: 1.5,
            ),
          ),
          filled: false,
          alignLabelWithHint: false,
          hintStyle: TextStyle(
            color: AppColors.overlay,
          ),
          fillColor: Colors.white,
          iconColor: AppColors.greyDarker,
          prefixIconColor: AppColors.greyDarker,
          suffixIconColor: AppColors.greyDarker,
          contentPadding: EdgeInsets.symmetric(
            vertical: AppSize.padding16,
            horizontal: AppSize.padding16,
          ),
        ),
      );

  static ThemeData dark(String languageCode) => ThemeData(
        // material 3
        useMaterial3: true,

        /// main colors
        primaryColor: AppColors.primaryDarkMode,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primaryDarkMode,
          brightness: Brightness.dark,
          secondary: AppColors.white,
          onSecondary: AppColors.secondDarkBlue,
          tertiary: AppColors.moreLighterDarkPeriwinkleDarkMode,
          primary: AppColors.primaryDarkMode,
          onPrimary: AppColors.primary,
          outline: AppColors.darkButtonBorder,
          surface: AppColors.lighterDarkBlue,
          onSurface: AppColors.white,
          error: AppColors.errorColor,
        ),

        extensions: [
          CustomColors(activeColor: AppColors.activeColor),
        ],

        radioTheme: RadioThemeData(
          fillColor: WidgetStatePropertyAll(AppColors.primary),
          visualDensity: VisualDensity.compact,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        // iconButtonTheme: IconButtonThemeData(
        //   style: ButtonStyle(
        //     iconColor: WidgetStatePropertyAll( AppColors.iconButton),
        //   ),
        // ),
        primarySwatch: AppColors.primarySwatch,
        scaffoldBackgroundColor: AppColors.primaryDarkMode,

        textSelectionTheme: TextSelectionThemeData(
          cursorColor: AppColors.primary,
          selectionColor: AppColors.primary,
          selectionHandleColor: AppColors.primary,
        ),

        menuButtonTheme: MenuButtonThemeData(
          style: ButtonStyle(
            textStyle: WidgetStatePropertyAll(
                TextStyle(color: Colors.white, fontSize: 14)),
          ),
        ),

        /// font family
        fontFamily: languageCode == 'ar' ? FontFamily.ibm : FontFamily.poppins,

        /// appBar theme
        dialogTheme: DialogThemeData(
          backgroundColor: AppColors.primaryDarkMode,
        ),

        /// appBar theme
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          scrolledUnderElevation: 0,
          elevation: 0,
          systemOverlayStyle: kSystemOverlayStyle,
          backgroundColor: AppColors.primaryDarkMode,
        ),

        /// button theme
        buttonTheme: const ButtonThemeData(
          shape: StadiumBorder(),
        ),

        /// Text Style
        textTheme: const TextTheme(
          /// The default text style for [Material].
          bodyMedium: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),

          headlineLarge: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w700,
          ),

          headlineMedium: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),

          /// Used for [Label] in [TextField] widget
          titleMedium: TextStyle(
            fontSize: 16,
          ),

          /// Used for [Text] in [TextField] widget
          bodyLarge: TextStyle(
            fontSize: 15,
            height: 1.4,
          ),

          /// Body Small - 13
          bodySmall: TextStyle(
            fontSize: 12,
            height: 1.4,
          ),
        ),

        /// input decoration theme
        inputDecorationTheme: const InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
            borderRadius: _inputRadius,
            borderSide: BorderSide(
              // color: AppColor.greyLighter,
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: _inputRadius,
            borderSide: BorderSide(
              // color: AppColor.greyLighter,
              width: 1.5,
            ),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(),
            borderRadius: _inputRadius,
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: _inputRadius,
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: _inputRadius,
            // borderSide: BorderSide(
            //   color: AppColor.redColor,
            //   width: 1.5,
            // ),
          ),
          filled: false,
          alignLabelWithHint: false,
          // hintStyle: TextStyle(
          //   color: AppColor.overlay,
          // ),
          fillColor: Colors.white,
          // iconColor: AppColor.greyDark,
          // prefixIconColor: AppColor.greyDark,
          // suffixIconColor: AppColor.greyDark,
          contentPadding: EdgeInsets.symmetric(
            vertical: AppSize.padding16,
            horizontal: AppSize.padding16,
          ),
          floatingLabelStyle: TextStyle(
            color: Colors.white,
          ),
        ),

        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            foregroundColor: WidgetStateProperty.all(AppColors.white),
          ),
        ),
      );
}
