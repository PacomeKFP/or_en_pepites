import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:or_en_pepite/src/services/Authentication/Auth.service.dart';
import 'package:or_en_pepite/src/views/Components/TextFormField.dart';

class AccountsFields extends StatelessWidget {
  AccountsFields({super.key});
  final controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            CustomTextField(
              controller: controller,
              icon: Icons.person_outline_sharp,
              label: "Votre nom ....",
              placedholder: FirebaseAuth.instance.currentUser!.displayName ??
                  "Veuillez entrer votre nom",
            ),
            const SizedBox(height: 10),
            OutlinedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    await AuthenticationService.updateUserName(controller.text)
                        .then((value) => ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(
                                content: Text(value
                                    ? "Données mises à jour avec success"
                                    : "Une erreur est survenue veuillez vérifer votre connexion internet, puis reéssayez"))));
                  }
                },
                child: const Text('Modifier mes informations'))
          ],
        ));
  }
}
