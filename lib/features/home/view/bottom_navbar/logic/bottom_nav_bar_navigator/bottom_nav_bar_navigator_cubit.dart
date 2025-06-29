import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bottom_nav_bar_navigator_state.dart';
part 'bottom_nav_bar_navigator_cubit.freezed.dart';

class BottomNavBarNavigatorCubit extends Cubit<BottomNavBarNavigatorState> {
  BottomNavBarNavigatorCubit()
      : super(const BottomNavBarNavigatorState.initial());

  int currentIndex = 0;

  void goToIndex(int index) {
    currentIndex = index;
    emit(BottomNavBarNavigatorState.back(index: currentIndex));
  }

  void goBack() {
    currentIndex = (currentIndex - 1) < 0 ? 4 : currentIndex - 1;
    emit(BottomNavBarNavigatorState.back(index: currentIndex));
  }

  void goNext() {
    currentIndex = (currentIndex + 1) > 4 ? 0 : currentIndex + 1;
    emit(BottomNavBarNavigatorState.back(index: currentIndex));
  }
}
