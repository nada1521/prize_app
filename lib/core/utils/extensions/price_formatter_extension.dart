
import 'package:easy_localization/easy_localization.dart';

extension StringPriceFormatter on num {
  String formatPrice() {
    final f = NumberFormat("###,###.#", "en_US");
    return f.format(this);
  }
}
