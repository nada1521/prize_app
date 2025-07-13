import 'package:prize/features/complete_profile/data/models/product_model.dart';
import 'package:prize/features/complete_profile/view/widgets/product/product_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildProductGrid extends StatelessWidget {
  const BuildProductGrid({super.key, required this.itemCard, this.count , this.productOnTap});

  final List<ProductModel> itemCard;
  final int? count;
  final void Function(ProductModel product)? productOnTap;
  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: count ?? itemCard.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: .45,
      ),
      itemBuilder: (context, index) {
        return Padding(
          padding:
              EdgeInsetsDirectional.only(start: 10.w, end: 10.w, bottom: 10.h),
          child: ProductWidget(
            itemData: itemCard[index],
            onTap: () => productOnTap?.call(itemCard[index]),
          ),
        );
      },
    );
  }
}
