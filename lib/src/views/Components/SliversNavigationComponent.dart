import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:or_en_pepite/src/core/configs/configs.dart';
import 'package:or_en_pepite/src/models/types/navigation.dart';
import 'package:or_en_pepite/src/utils/functions.dart';

class NavigationComponent extends StatefulWidget {
  final Map? data;
  final PageController controller;
  const NavigationComponent(
      {super.key, required this.data, required this.controller});

  @override
  State<NavigationComponent> createState() => _NavigationComponentState();
}

class _NavigationComponentState extends State<NavigationComponent> {
  int _activeIndex = 0;


  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      actions: [],
      automaticallyImplyLeading: false,
      flexibleSpace: Container(
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: widget.data!.keys.toList().map((key) {
            int pageIndex = widget.data!.keys.toList().indexOf(key);
            bool _isActive = _activeIndex == pageIndex &&
                widget.controller.positions.isNotEmpty;
            BottomNavigationItem item =
                BottomNavigationItem.blog.fromString(key.toString());
            return TextButton(
              onPressed: () async {
                try {
                  await widget.controller.animateToPage(pageIndex,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut);
                  setState(
                      () => _activeIndex = widget.controller.page!.toInt());
                } catch (e) {
                  print(e);
                }
              },
              child: Column(
                children: [
                  _isActive
                      ? Text(
                          "${item.label} en Pépites",
                          overflow: TextOverflow.fade,
                          style: GoogleFonts.quicksand(
                            color: _isActive
                                ? AppColors.light().gold
                                : Colors.black,
                            fontWeight:
                                _isActive ? FontWeight.w900 : FontWeight.w300,
                            fontSize: _isActive ? 16 : 14,
                          ),
                        )
                      : Icon(item.icon, size: 24, color: Colors.black,),
                  const SizedBox(height: 6),
                  _isActive
                      ? Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 2),
                          decoration: BoxDecoration(
                            color: AppColors.light().gold,
                            borderRadius: BorderRadius.circular(30),
                          ),
                        )
                      : SizedBox()
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
