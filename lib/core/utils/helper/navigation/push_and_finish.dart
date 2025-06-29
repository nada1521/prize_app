import 'package:flutter/material.dart';

Future<void> pushAndFinish(
  BuildContext context,
  Widget screen, {
  bool Function(Route<dynamic>)? predicate,
}) async {
  await Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context) => screen),
    predicate ?? (route) => false,
  );
}
