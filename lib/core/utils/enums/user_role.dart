import 'package:flutter/foundation.dart';

enum UserRole {
  user;

  bool get isUser => this == UserRole.user;

  static UserRole fromString(String? value) {
    try {
      return UserRole.values.firstWhere(
            (element) => element.name == value,
        orElse: () => UserRole.user,
      );
    } catch (e) {
      if(kDebugMode) rethrow;
      return UserRole.user;
    }
  }
}
