import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prize/core/utils/helper/navigation/push_to.dart';
import 'package:prize/core/utils/resources/app_colors.dart';
import 'package:prize/core/utils/resources/app_widget_color.dart';
import 'package:prize/features/product_details/views/widgets/zome_image_screen.dart';

class ImagesSliderWidget extends StatefulWidget {
  const ImagesSliderWidget({super.key, required this.images});
  final List<String> images;
  @override
  State<ImagesSliderWidget> createState() => _ImagesSliderWidgetState();
}

class _ImagesSliderWidgetState extends State<ImagesSliderWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350.h,
      width: 350.w,
      child: Swiper(
        autoplay: true,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: InkWell(
                onTap: () {
                  pushTo(
                      context,
                      ZoomImageWidget(
                        imageUrl: widget.images[index],
                      ));
                },
                child: CachedNetworkImage(
                  imageUrl: widget.images[index],
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
          );
        },
        itemCount: widget.images.length,
        onIndexChanged: (value) {
          // context.read<PayCubit>().swiperImageIndex = value;
          // print(context.read<PayCubit>().swiperImageIndex);
          // print(value);
        },
        pagination: SwiperPagination(
          margin: EdgeInsets.symmetric(vertical: 20.h),
          builder: DotSwiperPaginationBuilder(
            color: AppWidgetColor.fillWithGrayAndDiColor(context),
            activeColor: AppColors.darkModeTanOrange,
          ),
        ),
        control: SwiperControl(
          color: AppColors.darkModeTanOrange,
          padding: const EdgeInsets.all(30),
        ),
      ),
    );
  }
}
