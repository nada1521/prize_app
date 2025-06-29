import 'package:prize/features/complete_profile/data/models/product_model.dart';
import 'package:prize/features/complete_profile/view/widgets/product/product_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildProductGrid extends StatelessWidget {
  BuildProductGrid({super.key});
  final List<ProductModel> itemCard = [
    ProductModel(
      image: 'https://m.media-amazon.com/images/I/21Ja9ORL97L._AC_.jpg',
      newPrice: '644',
      oldPrice: r'844',
      title: 'Philips PowerPro\nCompact Bagless Vacu nada',
      isOffer: false,
    ),
    ProductModel(
      image: 'https://m.media-amazon.com/images/I/21Ja9ORL97L._AC_.jpg',
      newPrice: '644',
      oldPrice: '844',
      title: 'Philips PowerPro\nCompact Bagless Vacu nada',
      isOffer: false,
    ),
    ProductModel(
      image: 'https://m.media-amazon.com/images/I/21Ja9ORL97L._AC_.jpg',
      newPrice: '644',
      oldPrice: '844',
      title: 'Philips PowerPro\nCompact Bagless Vacu nada',
      isOffer: false,
    ),
    ProductModel(
      image: 'https://m.media-amazon.com/images/I/21Ja9ORL97L._AC_.jpg',
      newPrice: '644',
      oldPrice: '844',
      title: 'Philips PowerPro\nCompact Bagless Vacu nada',
      isOffer: false,
    ),
    ProductModel(
      image: 'https://m.media-amazon.com/images/I/21Ja9ORL97L._AC_.jpg',
      newPrice: '644',
      oldPrice: '844',
      title: 'Philips PowerPro\nCompact Bagless Vacu nada',
      isOffer: false,
    ),
    ProductModel(
      image: 'https://m.media-amazon.com/images/I/21Ja9ORL97L._AC_.jpg',
      newPrice: '644',
      oldPrice: '844',
      title: 'Philips PowerPro\nCompact Bagless Vacu nada',
      isOffer: false,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: itemCard.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: .45,
      ),
      itemBuilder: (context, index) {
        return Padding(
          padding:
              EdgeInsetsDirectional.only(start: 10.w, end: 10.w, bottom: 10.h),
          child: ProductWidget(itemData: itemCard[index]),
        );
      },
    );
  }
}
