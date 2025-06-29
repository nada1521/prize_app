import 'dart:ui';

import 'package:equatable/equatable.dart';

class LanguageModel extends Equatable {
  final String code;
  final String title;
  final String imagePath;

  Locale get locale => Locale(code);

  const LanguageModel({
    required this.imagePath,
    required this.title,
    required this.code,
  });

  @override
  List<Object> get props => [code, title, imagePath];
}
