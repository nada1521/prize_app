import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:prize/features/complete_profile/data/models/product_model.dart';

part 'adding_product_to_wishlist_state.dart';
part 'adding_product_to_wishlist_cubit.freezed.dart';

class AddingProductToWishlistCubit extends Cubit<AddingProductToWishlistState> {
  AddingProductToWishlistCubit()
      : super(AddingProductToWishlistState.initial());

  void addProduct(ProductModel product) {
    if (!state.selectedProducts.contains(product)) {
      emit(state.copyWith(
        selectedProducts: [...state.selectedProducts, product],
      ));
    }
  }

  void removeProduct(ProductModel product) {
    emit(state.copyWith(
      selectedProducts: state.selectedProducts
          .where((element) => element != product)
          .toList(),
    ));
  }

  void toggleProduct(ProductModel product) {
    if (state.selectedProducts.contains(product)) {
      removeProduct(product);
    } else {
      addProduct(product);
    }
  }

  void clear() {
    emit(state.copyWith(selectedProducts: []));
  }

  bool isSelected(ProductModel product) {
    return state.selectedProducts.contains(product);
  }
}
