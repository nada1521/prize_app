// ignore_for_file: public_member_api_docs, sort_constructors_first
class SettingItemModel {
  final String imagePath;
  final String title;
  void Function()? onTap;
  final bool? isDarkModeButton;
  final bool? isChangeLanguageButton;
  SettingItemModel({
    required this.imagePath,
    required this.title,
    this.onTap,
    this.isChangeLanguageButton,
    this.isDarkModeButton,
  });
}
