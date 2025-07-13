// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prize/core/constant/app_svgs.dart';
import 'package:prize/core/utils/helper/spacing.dart';
import 'package:prize/core/utils/resources/app_colors.dart';
import 'package:prize/core/utils/resources/app_widget_color.dart';
import 'package:prize/features/complete_profile/data/models/product_model.dart';
import 'package:prize/features/complete_profile/wishlist/logic/adding_product_to_cart_cubit/adding_product_to_cart_cubit.dart';
import 'package:prize/features/complete_profile/wishlist/logic/adding_product_to_wishlist_cubit/adding_product_to_wishlist_cubit.dart';
import 'package:prize/features/product_details/views/widgets/buttom_sheets/confirm_order_to_cart_bottom_sheet_widget.dart';

class ProductActionsWidget extends StatefulWidget {
  const ProductActionsWidget({
    super.key,
    required this.itemData,
  });

  final ProductModel itemData;

  @override
  State<ProductActionsWidget> createState() => _ProductActionsWidgetState();
}

class _ProductActionsWidgetState extends State<ProductActionsWidget> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildActionButton(
          onTap: () {
            setState(() {
              isFavorite = !isFavorite;
            });

            context
                .read<AddingProductToWishlistCubit>()
                .addProduct(widget.itemData);
          },
          iconPath: isFavorite ? AppSvgs.fiilHeartIcon : AppSvgs.heart,
          iconColor: isFavorite
              ? AppWidgetColor.favoriteSelectedIconColor
              : AppWidgetColor.favoriteUnSelectedIconColor(context),
        ),
        horizontalSpace(10),
        _buildActionButton(
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder: (context) => SizedBox(
                height: 250.h,
                child: ConfirmOrderToCartBottomSheetWidget(
                  itemData: widget.itemData,
                ),
              ),
            );
            context
                .read<AddingProductToCartCubit>()
                .addProduct(widget.itemData);
          },
          iconPath: AppSvgs.trash,
          iconColor: AppColors.lighterOrange,
        ),
      ],
    );
  }

  Widget _buildActionButton(
      {required String iconPath,
      required Color iconColor,
      required void Function()? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: AppColors.grey,
            width: 1.5,
          ),
        ),
        padding: const EdgeInsets.all(8),
        child: SvgPicture.asset(
          iconPath,
          color: iconColor,
          width: 24.w,
          height: 24.h,
        ),
      ),
    );
  }
}
