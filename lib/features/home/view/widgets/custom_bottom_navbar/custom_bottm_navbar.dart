import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prize/core/constant/app_svgs.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    List<_NavItem> items = [
      _NavItem('Home', AppSvgs.home),
      _NavItem('Shop', AppSvgs.shop),
      _NavItem('Cart', AppSvgs.cart),
      _NavItem('Profile', AppSvgs.profile),
    ];

    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 5),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(items.length, (index) {
          final isSelected = selectedIndex == index;
          return GestureDetector(
            onTap: () => onItemTapped(index),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: EdgeInsets.all(6),
                  decoration: isSelected
                      ? BoxDecoration(
                          color: Color(0xFFFFF3EE),
                          shape: BoxShape.circle,
                        )
                      : null,
                  child: SvgPicture.asset(
                    items[index].icon,
                    color:
                        isSelected ? Color(0xFFFF9D61) : Colors.grey.shade500,
                    width: 24,
                    height: 24,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  items[index].label,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color:
                        isSelected ? Color(0xFFFF9D61) : Colors.grey.shade500,
                  ),
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}

class _NavItem {
  final String label;
  final String icon;
  _NavItem(this.label, this.icon);
}
