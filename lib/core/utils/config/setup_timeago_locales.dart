import 'package:prize/core/utils/config/time_ago_ar_config.dart';
import 'package:timeago/timeago.dart' as timeago;

/// This method is used to setup timeago locales with custom messages.
void setupTimeAgoLocales() {
  timeago.setLocaleMessages('ar', CustomArMessages());
  timeago.setLocaleMessages('ar_short', CustomArShortMessages());
}
