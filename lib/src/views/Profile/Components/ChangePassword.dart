import 'package:flutter/material.dart';
import 'package:or_en_pepite/src/core/configs/configs.dart';
import 'package:or_en_pepite/src/views/Components/TextFormField.dart';

class ChangePasswordComponent extends StatefulWidget {
  const ChangePasswordComponent({super.key});

  @override
  State<ChangePasswordComponent> createState() =>
      _ChangePasswordComponentState();
}

class _ChangePasswordComponentState extends State<ChangePasswordComponent> {
  List<TextEditingController> controllers =
      [0, 1].map((e) => TextEditingController()).toList();
  List<String> labels = ['Nouveau Mot de passe', 'Confirmer le mot de passe'];
  final GlobalKey<FormState> _formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () => showDialog(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: const Text('Modification de mot de passe'),
              content: Form(
                key: _formKey,
                child: Column(
                  children: [
                    ...[0, 1]
                        .map((i) => CustomTextField(
                              controller: controllers[i],
                              label: labels[i],
                              placedholder: labels[i],
                              icon: Icons.key_sharp,
                              isObscurable: true,
                            ))
                        .toList(),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
              actions: [
                OutlinedButton.icon(
                  onPressed: () => debugPrint('ValidateForm'),
                  icon: const Icon(
                    Icons.check,
                    color: Colors.lightGreenAccent,
                  ),
                  label: const Text('Modifier'),
                ),
                const SizedBox(width: Dimens.space),
                TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Theme.of(context).colorScheme.error)
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('Annuler'))
              ],
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
                color: AppColors.light().gold,
                borderRadius:
                    const BorderRadius.all(Radius.circular(Dimens.radius))),
            padding: const EdgeInsets.symmetric(
                vertical: Dimens.padding, horizontal: Dimens.halfSpace),
            child: const Text('Modifier mon mot de passe'),
          ),
        )
      ],
    );
  }
}
