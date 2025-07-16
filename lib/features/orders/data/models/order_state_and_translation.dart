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
  OrderState.inProgress: LocaleKeys.OrderState_inprogress,
  OrderState.delivered: LocaleKeys.OrderState_delivered,
  OrderState.cancelled: LocaleKeys.OrderState_cancelled,
  OrderState.ordered: LocaleKeys.OrderState_ordered,
  OrderState.confirmed: LocaleKeys.OrderState_confirmed,
  OrderState.shipped: LocaleKeys.OrderState_shipped
};

//واضيف لها خاصية جديدة on دى بتخلينى اعرف اعمل اى امتداد ل اى قيمة من الحاجة البعد كلمه  extension
// دا اسمها هيا عادى OrderStateLocalization
// دا الاسم الهستخدمها منوا  translated
// ودى الهتجيب الترجمة tr() الحالية value هيا قيمة  this
extension OrderStateLocalization on OrderState {
  String get translated => orderStatetranslation[this]!.tr();
}
