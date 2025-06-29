import 'package:prize/core/utils/resources/app_images.dart';
import 'package:prize/features/language/data/model/language_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class Language {
  static const List<LanguageModel> _languages = [
    LanguageModel(imagePath: AppImages.arFlag, title: 'العربية', code: 'ar'),
    LanguageModel(imagePath: AppImages.enFlag, title: 'English', code: 'en'),
  ];

  static List<LanguageModel> get languages => _languages;

  static List<Locale> locales = _languages.map((e) => e.locale).toList();

  static Future<void> changeLanguage(
    BuildContext context, {
    required Locale locale,
  }) async {
    await context.setLocale(locale);
    return;
  }
}
