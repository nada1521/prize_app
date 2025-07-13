import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AppUrls {

  static String policyUrl(BuildContext context)=> context.locale.languageCode =="ar" ? 'https://prize.sa/pages/1':"https://prize.sa/en/pages/1";
  static String teremsAndConditionUrl(BuildContext context)=> context.locale.languageCode =="ar" ? 'https://prize.sa/pages/2':"https://prize.sa/en/pages/2";
  static String becameAsellerUrl(BuildContext context)=> context.locale.languageCode =="ar" ? 'https://prize.sa/become-seller':"https://prize.sa/en/become-seller";

}
