import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prize/core/utils/generated/tr_locale_keys.g.dart';
import 'package:prize/core/utils/helper/spacing.dart';
import 'package:prize/features/point/view/widgets/item_point_voucher.dart';
import 'package:prize/features/point/view/widgets/item_point_claimed.dart';

class PointTabBar extends StatefulWidget {
  const PointTabBar({super.key});

  @override
  State<PointTabBar> createState() => _PointTabBarState();
}

class _PointTabBarState extends State<PointTabBar> {
  int selectedIndex = 0;

  final List<String> titles = [
    LocaleKeys.point_screen_claimed.tr(),
    LocaleKeys.point_screen_Voucher.tr()
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 18.w,
      ),
      child: Column(
        children: [
          // Tabs Row
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
            decoration: BoxDecoration(
              color: Color(0xffeaecf8),
              borderRadius: BorderRadius.circular(14.r),
            ),
            child: Row(
              children: List.generate(titles.length, (index) {
                final isSelected = selectedIndex == index;
                return Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 10),
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: isSelected ? Colors.white : Colors.transparent,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        titles[index],
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: isSelected ? Colors.black : Colors.grey,
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
          verticalSpace(20),
          Expanded(
            child: IndexedStack(
              index: selectedIndex,
              children: [claimedListView(), voucherListView()],
            ),
          )
        ],
      ),
    );
  }

  Widget claimedListView() {
    return ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: 5,
        itemBuilder: (context, index) {
          return ItemPointClaimed();
        });
  }

  Widget voucherListView() {
    return ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: 5,
        itemBuilder: (context, index) {
          return ItemPointVoucher();
        });
  }
}
