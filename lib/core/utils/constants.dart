import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prize/core/constant/app_images.dart';
import 'package:prize/core/utils/extensions/context_extension.dart';
import 'package:prize/features/complete_profile/data/models/product_model.dart';
import 'package:prize/features/orders/data/models/order_model.dart';
import 'package:prize/features/orders/data/models/order_state_and_translation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'helper/navigation/navigation_manager.dart';

bool isFirstTimeForUser = false;

final List<ProductModel> productsWithoutOffer = [
  ProductModel(
    image:
        'https://vfgvipnlrjvzdoxiiaoj.supabase.co/storage/v1/object/public/product_images//Screenshot_2025-07-10_213549-removebg-preview.png',
    newPrice: '644',
    oldPrice: r'844',
    title: 'Phidlps PowerPro\nCompact Bagless Vacu nada',
    isOffer: false,
  ),
  ProductModel(
    image:
        'https://vfgvipnlrjvzdoxiiaoj.supabase.co/storage/v1/object/public/product_images//Screenshot_2025-07-10_213549-removebg-preview.png',
    newPrice: '644',
    oldPrice: '844',
    title: 'Phiips PowerPro\nCompact Bagless Vacu nada',
    isOffer: false,
  ),
  ProductModel(
    image:
        'https://vfgvipnlrjvzdoxiiaoj.supabase.co/storage/v1/object/public/product_images//Screenshot_2025-07-10_213549-removebg-preview.png',
    newPrice: '644',
    oldPrice: '844',
    title: 'hilips PowerPro\nCompact Bagless Vacu nada',
    isOffer: false,
  ),
  ProductModel(
    image:
        'https://vfgvipnlrjvzdoxiiaoj.supabase.co/storage/v1/object/public/product_images//Screenshot_2025-07-10_213549-removebg-preview.png',
    newPrice: '644',
    oldPrice: '844',
    title: 'Philip PowerPro\nCompact Bagless Vacu nada',
    isOffer: false,
  ),
  ProductModel(
    image:
        'https://vfgvipnlrjvzdoxiiaoj.supabase.co/storage/v1/object/public/product_images//Screenshot_2025-07-10_213549-removebg-preview.png',
    newPrice: '644',
    oldPrice: '844',
    title: 'Phlips PowerPro\nCompact Bagless Vacu nada',
    isOffer: false,
  ),
  ProductModel(
    image:
        'https://vfgvipnlrjvzdoxiiaoj.supabase.co/storage/v1/object/public/product_images//Screenshot_2025-07-10_213549-removebg-preview.png',
    newPrice: '644',
    oldPrice: '844',
    title: 'Philps PowerPro\nCompact Bagless Vacu nada',
    isOffer: false,
  ),
];

final List<ProductModel> productsWitOffer = [
  ProductModel(
    image:
        'https://vfgvipnlrjvzdoxiiaoj.supabase.co/storage/v1/object/public/product_images//Screenshot_2025-07-10_213549-removebg-preview.png',
    newPrice: '644',
    oldPrice: r'844',
    title: 'Pidlips PowerPro\nCompact Bagless Vacu nada',
    isOffer: true,
  ),
  ProductModel(
    image:
        'https://vfgvipnlrjvzdoxiiaoj.supabase.co/storage/v1/object/public/product_images//Screenshot_2025-07-10_213549-removebg-preview.png',
    newPrice: '644',
    oldPrice: '844',
    title: 'Phidlip PowerPro\nCompact Bagless Vacu nada',
    isOffer: true,
  ),
  ProductModel(
    image:
        'https://vfgvipnlrjvzdoxiiaoj.supabase.co/storage/v1/object/public/product_images//Screenshot_2025-07-10_213549-removebg-preview.png',
    newPrice: '644',
    oldPrice: '844',
    title: 'Phidlps PowerPro\nCompact Bagless Vacu nada',
    isOffer: true,
  ),
  ProductModel(
    image:
        'https://vfgvipnlrjvzdoxiiaoj.supabase.co/storage/v1/object/public/product_images//Screenshot_2025-07-10_213549-removebg-preview.png',
    newPrice: '644',
    oldPrice: '844',
    title: 'Philips PowerPro\nCompact Bagless Vacu nada',
    isOffer: true,
  ),
  ProductModel(
    image:
        'https://vfgvipnlrjvzdoxiiaoj.supabase.co/storage/v1/object/public/product_images//Screenshot_2025-07-10_213549-removebg-preview.png',
    newPrice: '644',
    oldPrice: '844',
    title: 'Phdlips PowerPro\nCompact Bagless Vacu nada',
    isOffer: true,
  ),
  ProductModel(
    image:
        'https://vfgvipnlrjvzdoxiiaoj.supabase.co/storage/v1/object/public/product_images//Screenshot_2025-07-10_213549-removebg-preview.png',
    newPrice: '644',
    oldPrice: '844',
    title: 'Phidlisps PowerPro\nCompact Bagless Vacu nada',
    isOffer: true,
  ),
];

List<ProductModel> selectedProducts = [];

final List<OrderModel> inProgressOrders = [
  OrderModel(
      orderId: "#82569841",
      orderPlaced: DateTime.now(),
      orderState: OrderState.inProgress,
      orderProductDataModel: [
        OrderProductDataModel(
          productImageUrl: AppImages.tShirt,
          productCount: 2,
          productPrice: 1443,
        ),
       
        OrderProductDataModel(
          productImageUrl: AppImages.tShirtBlack,
          productCount: 1,
          productPrice: 1443,
        ),
      ]),
  OrderModel(
      orderId: "#82669841",
      orderPlaced: DateTime.now(),
      orderState: OrderState.shipped,
      orderProductDataModel: [
        OrderProductDataModel(
          productImageUrl: AppImages.tShirt,
          productCount: 2,
          productPrice: 1443,
        ),
        OrderProductDataModel(
          productImageUrl: AppImages.tShirtBlack,
          productCount: 1,
          productPrice: 1443,
        ),
      ]),
  OrderModel(
      orderId: "#82769841",
      orderPlaced: DateTime.now(),
      orderState: OrderState.inProgress,
      orderProductDataModel: [
        OrderProductDataModel(
          productImageUrl: AppImages.tShirt,
          productCount: 2,
          productPrice: 1443,
        ),
        OrderProductDataModel(
          productImageUrl: AppImages.tShirtBlack,
          productCount: 1,
          productPrice: 1443,
        ),
      ]),
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

EdgeInsetsGeometry screensPadding = EdgeInsets.symmetric(
  horizontal: 20.w,
  vertical: 20.h,
);
