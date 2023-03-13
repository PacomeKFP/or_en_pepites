import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:or_en_pepite/src/core/configs/configs.dart';
import 'package:or_en_pepite/src/models/types/navigation.dart';

class AppNavigation extends StatelessWidget {
  final int currentIndex;
  const AppNavigation({super.key, required this.currentIndex});
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.shifting,
        currentIndex: currentIndex,
        onTap: (int index) {
          // setState(() => _index = index);
          if (index != currentIndex) {
            context.router.replaceNamed(BottomNavigationItem.values[index].path);
          }
        },
        items: BottomNavigationItem.values
            .map(
              (button) => BottomNavigationBarItem(
                label: button.label,
                icon: Icon(
                  button.icon,
                  color: Colors.black87,
                ),
                activeIcon: Icon(
                  button.icon,
                  color: AppColors.light().gold,
                ),
                tooltip: button.label,
                backgroundColor: Colors.white70,
              ),
            )
            .toList());
  }
}
