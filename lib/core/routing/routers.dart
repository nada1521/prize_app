sealed class AppRoutes {
  static const String login = '/login';
  static const String signUp = '/signUp';
  static const String forgetPassword = '/forgetPassword';
  static const String otp = '/otp';
  static const String completeProfile = '/completeProfile';
  static const String addItems = '/addItems';
  static const String home = '/home';
  static const String bottomNavBar = '/bottomNavBar';
  static const String productDetails = '/productDetails';

  static const String tabs = '/tabs';
  static const String onBoarding = '/boarding_screen';

  static const String search = '/search';
  static const String selectPackage = '/select_package';
  static const String publishProperty = '/publish_property';

  /// Routes Getters
  // static Future<T?> pushToPaymentMethods<T>(
  //   PaymentArguments arguments, {
  //   bool replacement = false,
  // }) async {
  //   if (replacement) {
  //     return Navigator.pushReplacementNamed(
  //       getContext(),
  //       _paymentMethods,
  //       arguments: arguments,
  //     );
  //   }
  //   return pushNamed<T>(_paymentMethods, arguments: arguments);
  // }
}
