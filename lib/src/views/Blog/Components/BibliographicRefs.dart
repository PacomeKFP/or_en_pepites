import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:or_en_pepite/src/core/configs/configs.dart';

class BibliographicRefs extends StatelessWidget {
  const BibliographicRefs({super.key});

  @override
  Widget build(BuildContext context) {
    bool refsIsOn = false;
    return StatefulBuilder(
        builder: (context, setState) => ListTile(
              title: TextButton(
                onPressed: () => setState(() => refsIsOn = !refsIsOn),
                child: Text(
                  'Consulter les References Bibliographiques',
                  style: GoogleFonts.quicksand(
                      color: AppColors.light().gold, fontSize: 16),
                ),
              ),
              subtitle: refsIsOn
                  ? Column(
                      children: AppTexts.refs
                          .map((e) => Wrap(
                                children: List.generate(
                                    e.length,
                                    (index) => Text(
                                          e[index],
                                          style: index == 1
                                              ? GoogleFonts.quicksand()
                                                  .copyWith(
                                                      fontStyle:
                                                          FontStyle.italic,
                                                      fontWeight:
                                                          FontWeight.w400)
                                              : null,
                                        ))
                                  ..add(const Divider(
                                    height: 2,
                                  )),
                              ))
                          .toList(),
                    )
                  : null,
            ));
  }
}
