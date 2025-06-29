import 'package:intl/intl.dart';

/// Helper class to parse data from APIs to get the desired data.
abstract class ApiDataParser {
  static int? getInt(i) {
    switch (i) {
      case String _:
        return double.tryParse(i)?.toInt();

      case int _:
        return i;
    }

    return null;
  }

  static double? getDouble(i) {
    switch (i) {
      case String _:
        return double.tryParse(i);

      case int _:
        return i.toDouble();

      case double _:
        return i;
    }

    return null;
  }

  /// Returns [num] if the data parsed successfully, otherwise returns [NULL].
  static num? getNum(i) {
    switch (i) {
      case String _:
        return double.tryParse(i);

      case num _:
        return i;
    }

    return null;
  }

  /// Returns [True] if the data is "1", "true", 1, or true.
  ///
  /// Otherwise returns [False].
  ///
  /// ### If the data is not [bool], [int], or [String], it returns [NULL].
  static bool? getBool(i) {
    switch (i) {
      case String _:
        return i == '1' || i == 'true';

      case int _:
        return i == 1;

      case bool _:
        return i;
    }

    return null;
  }

  /// Convert int (stamp) to DateTime instance
  static DateTime? getDateTimeFromStamp(i) {
    final timeStamp = getInt(i);
    return timeStamp != null ? DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000) : null;
  }

  /// Convert string to DateTime with format yyyy-MM-dd
  static DateTime? getDateTimeFromFormattedStringYYYYMMDD(String? i) {
    if (i == null) return null;
    return DateFormat("yyyy-MM-dd").tryParse(i);
  }

  /// Parse string to DateTime or return current date if the parsing failed.
  static DateTime getDateTimeFromStringOrGetCurrent(String? i) {
    if (i == null) return DateTime.now();
    return DateTime.tryParse(i) ?? DateTime.now();
  }
}

