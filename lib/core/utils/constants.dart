import 'package:prize/core/utils/extensions/context_extension.dart';
import 'package:prize/features/complete_profile/data/models/product_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'helper/navigation/navigation_manager.dart';

bool isFirstTimeForUser = false;

final List<ProductModel> productsWithoutOffer = [
  ProductModel(
    image: 'https://m.media-amazon.com/images/I/21Ja9ORL97L._AC_.jpg',
    newPrice: '644',
    oldPrice: r'844',
    title: 'Philips PowerPro\nCompact Bagless Vacu nada',
    isOffer: false,
  ),
  ProductModel(
    image: 'https://m.media-amazon.com/images/I/21Ja9ORL97L._AC_.jpg',
    newPrice: '644',
    oldPrice: '844',
    title: 'Philips PowerPro\nCompact Bagless Vacu nada',
    isOffer: false,
  ),
  ProductModel(
    image: 'https://m.media-amazon.com/images/I/21Ja9ORL97L._AC_.jpg',
    newPrice: '644',
    oldPrice: '844',
    title: 'Philips PowerPro\nCompact Bagless Vacu nada',
    isOffer: false,
  ),
  ProductModel(
    image: 'https://m.media-amazon.com/images/I/21Ja9ORL97L._AC_.jpg',
    newPrice: '644',
    oldPrice: '844',
    title: 'Philips PowerPro\nCompact Bagless Vacu nada',
    isOffer: false,
  ),
  ProductModel(
    image: 'https://m.media-amazon.com/images/I/21Ja9ORL97L._AC_.jpg',
    newPrice: '644',
    oldPrice: '844',
    title: 'Philips PowerPro\nCompact Bagless Vacu nada',
    isOffer: false,
  ),
  ProductModel(
    image: 'https://m.media-amazon.com/images/I/21Ja9ORL97L._AC_.jpg',
    newPrice: '644',
    oldPrice: '844',
    title: 'Philips PowerPro\nCompact Bagless Vacu nada',
    isOffer: false,
  ),
];

final List<ProductModel> productsWitOffer = [
  ProductModel(
    image: 'https://m.media-amazon.com/images/I/21Ja9ORL97L._AC_.jpg',
    newPrice: '644',
    oldPrice: r'844',
    title: 'Philips PowerPro\nCompact Bagless Vacu nada',
    isOffer: true,
  ),
  ProductModel(
    image: 'https://m.media-amazon.com/images/I/21Ja9ORL97L._AC_.jpg',
    newPrice: '644',
    oldPrice: '844',
    title: 'Philips PowerPro\nCompact Bagless Vacu nada',
    isOffer: true,
  ),
  ProductModel(
    image: 'https://m.media-amazon.com/images/I/21Ja9ORL97L._AC_.jpg',
    newPrice: '644',
    oldPrice: '844',
    title: 'Philips PowerPro\nCompact Bagless Vacu nada',
    isOffer: true,
  ),
  ProductModel(
    image: 'https://m.media-amazon.com/images/I/21Ja9ORL97L._AC_.jpg',
    newPrice: '644',
    oldPrice: '844',
    title: 'Philips PowerPro\nCompact Bagless Vacu nada',
    isOffer: true,
  ),
  ProductModel(
    image: 'https://m.media-amazon.com/images/I/21Ja9ORL97L._AC_.jpg',
    newPrice: '644',
    oldPrice: '844',
    title: 'Philips PowerPro\nCompact Bagless Vacu nada',
    isOffer: true,
  ),
  ProductModel(
    image: 'https://m.media-amazon.com/images/I/21Ja9ORL97L._AC_.jpg',
    newPrice: '644',
    oldPrice: '844',
    title: 'Philips PowerPro\nCompact Bagless Vacu nada',
    isOffer: true,
  ),
];

abstract class AppConstants {
  static const String dialCode = "20";
  static const String dialCodePlus = "+$dialCode";
  static const double _aspectRatioTablet = 4.5;
  static const double _aspectRatioMobile = 2.5;
  static final double aspectRatio = NavigatorManager.getContext().isTablet
      ? _aspectRatioTablet
      : _aspectRatioMobile;
}

abstract class AppStrings {
  static const String token = '/token';
  static const String isFirstOpen = '/is-first-open';
  static const String isFirstLogin = '/is-first-login';
  static const String guestToken = "/guest-token";
  static const String isDarkMode = "/is-dark-mode";
}

tologFirstTimeChecker({required bool isFirstTime}) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setBool('isFirstTime', isFirstTime);
}

checkFirstTimeChecker() async {
  final prefs = await SharedPreferences.getInstance();
  final bool isFirstTime = prefs.getBool('isFirstTime') ?? true;
  isFirstTimeForUser = isFirstTime;
}
