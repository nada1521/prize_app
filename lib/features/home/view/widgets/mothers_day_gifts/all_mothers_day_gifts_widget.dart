import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prize/core/routing/routers.dart';
import 'package:prize/core/utils/extensions/navigation_extension.dart';
import 'package:prize/features/complete_profile/data/models/product_model.dart';
import 'package:prize/features/complete_profile/view/widgets/product/product_widget.dart';

class AllMothersDayGiftsWidget extends StatelessWidget {
  const AllMothersDayGiftsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ProductModel> itemCard = [
      ProductModel(
        image: 'https://m.media-amazon.com/images/I/21Ja9ORL97L._AC_.jpg',
        newPrice: '644',
        oldPrice: r'844',
        title: 'Philips PowerPro\nCompact Bagless Vacu nada',
        isOffer: true,
      ),
      ProductModel(
        image: 'https://m.media-amazon.com/images/I/21Ja9ORL97L._AC_.jpg',
        newPrice: '644',
        oldPrice: '844',
        title: 'Philips PowerPro\nCompact Bagless Vacu nada',
        isOffer: true,
      ),
      ProductModel(
        image: 'https://m.media-amazon.com/images/I/21Ja9ORL97L._AC_.jpg',
        newPrice: '644',
        oldPrice: '844',
        title: 'Philips PowerPro\nCompact Bagless Vacu nada',
        isOffer: true,
      ),
      ProductModel(
        image: 'https://m.media-amazon.com/images/I/21Ja9ORL97L._AC_.jpg',
        newPrice: '644',
        oldPrice: '844',
        title: 'Philips PowerPro\nCompact Bagless Vacu nada',
        isOffer: true,
      ),
      ProductModel(
        image: 'https://m.media-amazon.com/images/I/21Ja9ORL97L._AC_.jpg',
        newPrice: '644',
        oldPrice: '844',
        title: 'Philips PowerPro\nCompact Bagless Vacu nada',
        isOffer: true,
      ),
      ProductModel(
        image: 'https://m.media-amazon.com/images/I/21Ja9ORL97L._AC_.jpg',
        newPrice: '644',
        oldPrice: '844',
        title: 'Philips PowerPro\nCompact Bagless Vacu nada',
        isOffer: true,
      ),
    ];
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemCount: itemCard.length,
      itemBuilder: (context, index) => Padding(
        padding:
            EdgeInsetsDirectional.only(start: 10.w, end: 10.w, bottom: 10.h),
        child: ProductWidget(
          itemData: itemCard[index],
          onTap: () {
            context.pushNamed(
              AppRoutes.productDetails,
              arguments: itemCard[index],
            );
          },
        ),
      ),
    );
  }
}
