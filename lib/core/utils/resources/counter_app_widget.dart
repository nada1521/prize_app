import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prize/core/utils/resources/app_widget_color.dart';
import 'package:prize/features/complete_profile/wishlist/logic/adding_product_to_cart_cubit/adding_product_to_cart_cubit.dart';

class CounterAppWidget extends StatefulWidget {
  const CounterAppWidget({
    super.key,
    required this.onChanged,
  });

  final ValueChanged<int> onChanged;

  @override
  State<CounterAppWidget> createState() => _CounterAppWidgetState();
}

class _CounterAppWidgetState extends State<CounterAppWidget> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140.w,
      constraints: BoxConstraints(
        maxHeight: 69.h,
        maxWidth: 140.w,
      ),
      decoration: BoxDecoration(
          color: AppWidgetColor.fillWidgetByLightBackgroundColor(context),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(16),
          border:
              Border.all(width: 2, color: AppWidgetColor.outlineWidgetColor)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              if (count > 0) {
                count--;
                widget.onChanged(count);
                setState(() {});
              }
            },
            icon: const Icon(Icons.remove),
          ),
          Text(
            '$count',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          IconButton(
            onPressed: () {
              count++;
              widget.onChanged(count);
              setState(() {});
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
