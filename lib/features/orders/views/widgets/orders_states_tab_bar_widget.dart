<<<<<<< HEAD

=======
>>>>>>> 88ebb915b88034c51a3af2c2dfa1a016c6870496
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prize/core/utils/helper/spacing.dart';
import 'package:prize/core/utils/resources/app_widget_color.dart';

class OrdersStatesTabBarWidget extends StatefulWidget {
  const OrdersStatesTabBarWidget({super.key, required this.tabItems});

  final Map<String, Widget> tabItems;
  @override
  State<OrdersStatesTabBarWidget> createState() =>
      _OrdersStatesTabBarWidgetState();
}

class _OrdersStatesTabBarWidgetState extends State<OrdersStatesTabBarWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppWidgetColor.fillWidgetByLightBackgroundColor(context),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
        child: Column(
          children: [
            // Tabs Row
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
              decoration: BoxDecoration(
                color: AppWidgetColor.fillWidgetColor(context),
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.w),
                child: Row(
                  children: List.generate(widget.tabItems.keys.toList().length,
                      (index) {
                    final isSelected = selectedIndex == index;
                    return Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                            color:
                                isSelected ? Colors.white : Colors.transparent,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          alignment: Alignment.center,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: FittedBox(
                              child: Text(
                                widget.tabItems.keys.toList()[index],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color:
                                      isSelected ? Colors.black : Colors.grey,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),

            verticalSpace(20),
            IndexedStack(
              index: selectedIndex,
              children: 
               widget.tabItems.values.toList(),
            
            )
          ],
        ),
      ),
    );
  }

}
