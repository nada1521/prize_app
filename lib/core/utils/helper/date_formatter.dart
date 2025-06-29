import 'package:easy_localization/easy_localization.dart';
import 'package:number_converter/number_converter.dart';
import 'package:prize/core/utils/helper/navigation/navigation_manager.dart';
import 'package:timeago/timeago.dart' as timeago;

class DateFormatter {
  static String get _code => NavigatorManager.navigatorKey.currentContext!.locale.languageCode;

  static String namedFull(DateTime date) {
    return DateFormat('EEE, d MMM - hh.mm a', _code).format(date).numbersToEnglish;
  }

  static String full(DateTime date) {
    return DateFormat('dd MMM yyyy • hh.mm a', _code).format(date).numbersToEnglish;
  }

  static String simpleWithoutY(DateTime date) {
    return DateFormat('d MMM • hh:mm a', _code).format(date).numbersToEnglish;
  }

  static String dateOnlyNamedMonth(DateTime date) {
    return DateFormat('dd MMM yyyy', _code).format(date).numbersToEnglish;
  }

  static String stringDateOnly(DateTime date) {
    return DateFormat('dd/MM/yyyy', _code).format(date).numbersToEnglish;
  }

  static String timeOnly(DateTime date) {
    return DateFormat('hh:mm a', _code).format(date).numbersToEnglish;
  }

  static String timeAgo(DateTime date) {
    return timeago.format(date, locale: _code, allowFromNow: true);
  }

  static String timeAgoShort(DateTime date) {
    return timeago.format(date, locale: "${_code}_short", allowFromNow: true);
  }
}
