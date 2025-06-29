import 'package:easy_localization/easy_localization.dart';
import 'package:prize/core/utils/generated/tr_locale_keys.g.dart';

enum GenderType {
  male,
  female;

  bool get isMale => this == GenderType.male;

  bool get isFemale => this == GenderType.female;

  static GenderType fromString(String? value) {
    switch (value) {
      case 'male':
        return GenderType.male;
      case 'female':
        return GenderType.female;
      default:
        return GenderType.male;
    }
  }

  String tr() {
    switch (this) {
      case GenderType.male:
        return LocaleKeys.gender_label_male.tr();
      case GenderType.female:
        return LocaleKeys.gender_label_female.tr();
    }
  }
}
