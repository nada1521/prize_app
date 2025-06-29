import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void setupBlocObserver() {
  if (kDebugMode) {
    Bloc.observer = const MyBlocObserver();
  }
}

class MyBlocObserver extends BlocObserver {
  const MyBlocObserver();

  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    debugPrint('onCreate: ${bloc.runtimeType}');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    debugPrint('onChange: ${bloc.runtimeType}, $change'.replaceAll('\n', ''));
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    debugPrint('onBlocError: ${bloc.runtimeType}, $error');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    debugPrint('onClose: ${bloc.runtimeType}');
  }
}
