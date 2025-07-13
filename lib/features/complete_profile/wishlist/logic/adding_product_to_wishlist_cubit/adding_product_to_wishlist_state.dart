part of 'adding_product_to_wishlist_cubit.dart';

@freezed
abstract class AddingProductToWishlistState
    with _$AddingProductToWishlistState {
  const factory AddingProductToWishlistState({
    required List<ProductModel> selectedProducts,
  }) = _AddingProductToWishlistState;

  factory AddingProductToWishlistState.initial() =>
      const AddingProductToWishlistState(selectedProducts: []);
}
