import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../data/repo/theme_repo.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  final ThemeRepo _themeRepo;

  ThemeCubit(this._themeRepo) : super(ThemeMode.system);

  void getAppTheme() => emit(_themeRepo.getAppTheme());

  FutureOr<void> changeAppTheme(ThemeMode themeMode) async {
    await _themeRepo.changeAppTheme(themeMode);
    emit(themeMode);
  }
}
