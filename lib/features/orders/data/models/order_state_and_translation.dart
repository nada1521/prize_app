import 'package:easy_localization/easy_localization.dart';
import 'package:prize/core/utils/generated/tr_locale_keys.g.dart';

enum OrderState {
  inProgress,
  delivered,
  cancelled,
  ordered,
  confirmed,
  shipped,
}

//كدا مشتغلش ف سألت واتعلمت حاجة جديدة map لما عملت ال
// OrderState.inProgress: LocaleKeys.OrderState_inprogress.tr(),
final Map<OrderState, String> orderStatetranslation = {
  OrderState.inProgress: LocaleKeys.order_state_inprogress,
  OrderState.delivered: LocaleKeys.order_state_delivered,
  OrderState.cancelled: LocaleKeys.order_state_cancelled,
  OrderState.ordered: LocaleKeys.order_state_ordered,
  OrderState.confirmed: LocaleKeys.order_state_confirmed,
  OrderState.shipped: LocaleKeys.order_state_shipped
};

//واضيف لها خاصية جديدة on دى بتخلينى اعرف اعمل اى امتداد ل اى قيمة من الحاجة البعد كلمه  extension
// دا اسمها هيا عادى OrderStateLocalization
// دا الاسم الهستخدمها منوا  translated
// ودى الهتجيب الترجمة tr() الحالية value هيا قيمة  this
extension OrderStateLocalization on OrderState {
  String get translated => orderStatetranslation[this]!.tr();
}
