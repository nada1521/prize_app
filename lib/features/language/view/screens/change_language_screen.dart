import 'package:prize/core/utils/common/languages.dart';
import 'package:prize/core/utils/extensions/text_style_extension.dart';
import 'package:prize/core/utils/resources/app_colors.dart';
import 'package:prize/core/utils/resources/app_size.dart';
import 'package:prize/core/widgets/main/app_button.dart';
import 'package:prize/core/widgets/main/snk_bar.dart';
import 'package:prize/features/language/data/model/language_model.dart';
import 'package:prize/core/utils/generated/tr_locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ChangeLanguageScreen extends StatefulWidget {
  const ChangeLanguageScreen({super.key});

  @override
  State<ChangeLanguageScreen> createState() => _ChangeLanguageScreenState();
}

class _ChangeLanguageScreenState extends State<ChangeLanguageScreen> {
  String? _selectedLang;
  final List<LanguageModel> _languages = Language.languages;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _init();
    });
  }

  void _init() {
    _selectedLang = context.locale.toString();
    setState(() {});
  }

  Future<void> _onChangeLanguage(BuildContext context) async {
    await Language.changeLanguage(context, locale: Locale(_selectedLang!));
    if (!context.mounted) return;
    // await pushAndFinish(context, const SplashScreen());
    SnkBar.showSuccess(LocaleKeys.settings_language_changed_success.tr());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocaleKeys.settings_change_language.tr(),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: AlignmentDirectional.centerStart,
            padding: const EdgeInsetsDirectional.only(
              start: AppSize.paddingLarge26,
              end: AppSize.paddingLarge26,
              top: AppSize.padding12,
              bottom: AppSize.padding12,
            ),
            child: Text(
              LocaleKeys.settings_select_language.tr(),
              style: context.styleHeadline2,
            ),
          ),
          Expanded(
            child: Scrollbar(
              child: SizedBox(
                width: double.infinity,
                child: ListView.builder(
                  itemCount: _languages.length,
                  padding: const EdgeInsets.symmetric(
                    vertical: AppSize.padding16,
                    horizontal: AppSize.paddingLarge26,
                  ),
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    final lang = _languages[index];

                    return _languageWidget(
                      context: context,
                      isSelected: _selectedLang == lang.code,
                      languageModel: lang,
                      index: index,
                    );
                  },
                ),
              ),
            ),
          ),

          // save button
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSize.paddingLarge26,
                vertical: AppSize.padding5,
              ),
              child: AppButton(
                title: LocaleKeys.action_save.tr(),
                stadiumBorder: false,
                onPressed: _selectedLang != null &&
                        _selectedLang != context.locale.toString()
                    ? () async {
                        await _onChangeLanguage(context);
                      }
                    : null,
                fit: true,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _languageWidget({
    required bool isSelected,
    required BuildContext context,
    required LanguageModel languageModel,
    required int index,
  }) {
    return InkWell(
      onTap: () {
        if (_selectedLang != languageModel.code) {
          setState(() {
            _selectedLang = languageModel.code;
          });
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: AppSize.padding16),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary.withValues(alpha: 0.15) : null,
          border: Border(
            top: BorderSide(
              width: 1.0,
              color: isSelected ? AppColors.primary : Colors.transparent,
            ),
            bottom: BorderSide(
              width: 1.0,
              color: isSelected ? AppColors.primary : Colors.transparent,
            ),
          ),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 15),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: 1.0,
                color: isSelected
                    ? Colors.transparent
                    : AppColors.greyLighter.withValues(alpha: 0.3),
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // language with flag
              Row(
                children: [
                  // Image.asset(
                  //   languageModel.imagePath,
                  //   fit: BoxFit.cover,
                  //   width: 40,
                  //   height: 34,
                  // ),
                  // const SizedBox(width: 30),
                  Text(
                    languageModel.title,
                    style: TextStyle(
                      fontWeight:
                          isSelected ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                ],
              ),
              isSelected
                  ? Icon(
                      Icons.check,
                      size: 25,
                      color: AppColors.primary,
                    )
                  : const SizedBox.shrink()
            ],
          ),
        ),
      ),
    );
  }
}
