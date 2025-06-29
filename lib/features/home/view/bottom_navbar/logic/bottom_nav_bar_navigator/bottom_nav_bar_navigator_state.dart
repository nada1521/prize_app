part of 'bottom_nav_bar_navigator_cubit.dart';

@freezed
abstract class BottomNavBarNavigatorState with _$BottomNavBarNavigatorState {
  const factory BottomNavBarNavigatorState.initial() = _Initial;
  const factory BottomNavBarNavigatorState.back({required int index}) = Back;
}
