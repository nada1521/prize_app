import 'package:flutter/material.dart';
import 'package:prize/features/cart/views/widgets/show_cart_products_widget.dart';
import 'package:prize/features/complete_profile/data/models/product_model.dart';

class AllCartProductsItemsWidget extends StatelessWidget {
  const AllCartProductsItemsWidget({super.key, required this.products});

  final List<ProductModel> products;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => ShowCartProductsWidget(
        product: products[index],
      ),
      itemCount: products.length,
    );
  }
}
