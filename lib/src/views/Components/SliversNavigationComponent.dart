import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:or_en_pepite/src/core/configs/configs.dart';
import 'package:or_en_pepite/src/logic/blocs.dart';
import 'package:or_en_pepite/src/models/types/navigation.dart';

class NavigationComponent extends StatefulWidget {
  final Map? data;
  final PageController controller;
  const NavigationComponent(
      {super.key, required this.data, required this.controller});

  @override
  State<NavigationComponent> createState() => _NavigationComponentState();
}

class _NavigationComponentState extends State<NavigationComponent> {
  final int _activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabsManagerBloc, TabsManagerState>(
      builder: (context, state) {
        TabsManagerInitial currentState = state as TabsManagerInitial;
        return SliverAppBar(
          actions: const [],
          automaticallyImplyLeading: false,
          flexibleSpace: SizedBox(
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: widget.data!.keys.toList().map((key) {
                int pageIndex = widget.data!.keys.toList().indexOf(key);

                bool isActive = _activeIndex == pageIndex &&
                    widget.controller.positions.isNotEmpty;

                isActive = currentState.curentPage == pageIndex;
                BottomNavigationItem item =
                    BottomNavigationItem.blog.fromString(key.toString());
                return TextButton(
                  onPressed: () async {
                    context
                        .read<TabsManagerBloc>()
                        .add(MoveToPage(nextPage: pageIndex));
                    try {
                      await widget.controller.animateToPage(pageIndex,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut);
                    } catch (e) {
                      // impl
                    }
                  },
                  child: Column(
                    children: [
                      isActive
                          ? Text(
                              "${item.label} en Pépites",
                              overflow: TextOverflow.fade,
                              style: GoogleFonts.quicksand(
                                color: isActive
                                    ? AppColors.light().gold
                                    : Colors.black,
                                fontWeight: isActive
                                    ? FontWeight.w900
                                    : FontWeight.w300,
                                fontSize: isActive ? 14 : 12,
                              ),
                            )
                          : Icon(
                              item.icon,
                              size: 22,
                              color: Colors.black,
                            ),
                      const SizedBox(height: 6),
                      isActive
                          ? Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 2),
                              decoration: BoxDecoration(
                                color: AppColors.light().gold,
                                borderRadius: BorderRadius.circular(30),
                              ),
                            )
                          : const SizedBox()
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}
