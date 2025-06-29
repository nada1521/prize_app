import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

extension FirstTimeChecker on BuildContext {
  Future<bool> get isNotFirstTime async {
    final prefs = await SharedPreferences.getInstance();
    final isFirstTime = prefs.getBool('isFirstTime') ?? true;

    if (isFirstTime) {
      await prefs.setBool('isFirstTime', false);
      return false;
    }

    return true;
  }
}
