/// Converts Arabic numbers to English numbers and vice versa
extension NumberConverter on String {
  String get numbersToEnglish {
    Map<String, String> digitMap = {
      '٠': '0',
      '١': '1',
      '٢': '2',
      '٣': '3',
      '٤': '4',
      '٥': '5',
      '٦': '6',
      '٧': '7',
      '٨': '8',
      '٩': '9',
    };

    return replaceAllMapped(
      RegExp(r'[٠-٩]'),
          (match) => digitMap[match.group(0)]!,
    );
  }

  String get numbersToArabic {
    Map<String, String> digitMap = {
      '0': '٠',
      '1': '١',
      '2': '٢',
      '3': '٣',
      '4': '٤',
      '5': '٥',
      '6': '٦',
      '7': '٧',
      '8': '٨',
      '9': '٩',
    };

    return replaceAllMapped(
      RegExp(r'[0-9]'),
          (match) => digitMap[match.group(0)]!,
    );
  }
}
