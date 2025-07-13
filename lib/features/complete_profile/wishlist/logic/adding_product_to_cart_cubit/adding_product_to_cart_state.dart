part of 'adding_product_to_cart_cubit.dart';

@freezed
abstract class AddingProductToCartState with _$AddingProductToCartState {
  const factory AddingProductToCartState({
    required List<ProductModel> selectedProducts,
  }) = _AddingProductToCartState;

  factory AddingProductToCartState.initial() =>
      const AddingProductToCartState(selectedProducts: []);
      
}
