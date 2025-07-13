import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:prize/features/complete_profile/data/models/product_model.dart';

part 'check_out_state.dart';
part 'check_out_cubit.freezed.dart';

class CheckOutCubit extends Cubit<CheckOutState> {
  CheckOutCubit() : super(CheckOutState.initial());

  List<ProductModel> products = [];

  void emitChangeProductQuintity() {
    emit(CheckOutState.changeProductQuintity());
  }
}
