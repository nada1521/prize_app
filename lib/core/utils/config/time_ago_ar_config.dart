import 'package:timeago/timeago.dart';

/// Arabic Messages
class CustomArMessages implements LookupMessages {
  @override
  String prefixAgo() => 'منذ';

  @override
  String prefixFromNow() => 'بعد';

  @override
  String suffixAgo() => '';

  @override
  String suffixFromNow() => '';

  @override
  String lessThanOneMinute(int sec) => "لحظات";

  @override
  String aboutAMinute(int min) => 'حوالي دقيقة';

  @override
  String minutes(int minutes) {
    if (minutes == 2) {
      return 'دقيقتين';
    } else if (minutes > 2 && minutes < 11) {
      return '$minutes دقائق';
    } else {
      return '$minutes دقيقة';
    }
  }

  @override
  String aboutAnHour(int minutes) => 'حوالي ساعة';

  @override
  String hours(int hours) {
    if (hours == 2) {
      return 'ساعتين';
    } else if (hours > 2 && hours < 11) {
      return '$hours ساعات';
    } else {
      return '$hours ساعة';
    }
  }

  @override
  String aDay(int hours) => 'يوم';

  @override
  String days(int days) {
    if (days == 2) {
      return 'يومين';
    } else if (days > 2 && days < 11) {
      return '$days أيام';
    } else {
      return '$days يوم';
    }
  }

  @override
  String aboutAMonth(int days) => 'حوالي شهر';

  @override
  String months(int months) {
    if (months == 2) {
      return 'شهرين';
    } else if (months > 2 && months < 11) {
      return '$months أشهر';
    } else if (months > 10) {
      return '$months شهر';
    }
    return '$months شهور';
  }

  @override
  String aboutAYear(int year) => 'حوالي عام';

  @override
  String years(int years) {
    if (years == 2) {
      return 'عامان';
    } else if (years > 2 && years < 11) {
      return '$years أعوام';
    } else {
      return '$years عام';
    }
  }

  @override
  String wordSeparator() => ' ';
}

/// Arabic short Messages
class CustomArShortMessages implements LookupMessages {
  @override
  String prefixAgo() => '';

  @override
  String prefixFromNow() => '';

  @override
  String suffixAgo() => '';

  @override
  String suffixFromNow() => '';

  @override
  String lessThanOneMinute(int seconds) => '$seconds ث';

  @override
  String aboutAMinute(int minutes) => '~1 د';

  @override
  String minutes(int minutes) => '$minutes د';

  @override
  String aboutAnHour(int minutes) => '~1 س';

  @override
  String hours(int hours) => '$hours س';

  @override
  String aDay(int hours) => '~1 ي';

  @override
  String days(int days) => '$days ي';

  @override
  String aboutAMonth(int days) => '~1 ش';

  @override
  String months(int months) => '$months ش';

  @override
  String aboutAYear(int year) => '~1 ع';

  @override
  String years(int years) => '$years ع';

  @override
  String wordSeparator() => ' ';
}
