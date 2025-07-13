part of 'check_out_cubit.dart';

@freezed
class CheckOutState with _$CheckOutState {
  const factory CheckOutState.initial() = _Initial;
  const factory CheckOutState.changeProductQuintity() = ChangeProductQuintity;
}
