import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:or_en_pepite/src/core/configs/configs.dart';
import 'package:or_en_pepite/src/models/models.dart';
import 'package:or_en_pepite/src/views/Components/TextFormField.dart';

class EmailPasswordAuth extends StatefulWidget {
  AuthType authType;
  EmailPasswordAuth({super.key, required this.authType});

  @override
  State<EmailPasswordAuth> createState() => _EmailPasswordStateAuth();
}

class _EmailPasswordStateAuth extends State<EmailPasswordAuth> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  Map<String, TextEditingController> controllers = {
    for (var item in ['email', 'password', 'password_confirm', 'full_name'])
      item.toString(): TextEditingController()
  };

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          widget.authType.label,
          style: Theme.of(context)
              .textTheme
              .headlineLarge!
              .copyWith(color: AppColors.light().gold),
        ),
        const SizedBox(height: 25),
        Form(
          key: _formKey,
          child: Column(
            children: [
              if (widget.authType == AuthType.register)
                CustomTextField(
                  controller: controllers['full_name']!,
                  icon: Icons.mail_outline_rounded,
                  label: 'Nom complet',
                  placedholder: 'Entrer votre nom ...',
                ),
              CustomTextField(
                controller: controllers['email']!,
                icon: Icons.mail_outline_rounded,
                label: 'Email',
                validators: [(v) => EmailValidator.isValidEmail(v)],
                placedholder: 'Entrer votre email ...',
              ),
              CustomTextField(
                controller: controllers['password']!,
                icon: Icons.mail_outline_rounded,
                label: 'Mot de passe',
                placedholder: 'Entrer votre mot de passe ...',
                isObscurable: true,
              ),
              if (widget.authType == AuthType.register)
                CustomTextField(
                  controller: controllers['password_confirm']!,
                  icon: Icons.mail_outline_rounded,
                  label: 'Confirmez votre mot de passe',
                  placedholder: 'Entrer votre mot de passe à nouveau...',
                  isObscurable: true,
                ),

              const SizedBox(height: 25),

              // Validation button
              InkWell(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: const BorderRadius.all(Radius.circular(8))),
                  width: double.infinity,
                  height: 45,
                  alignment: Alignment.center,
                  child: Text(widget.authType.label,
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(
                              color: Theme.of(context).colorScheme.onPrimary)),
                ),
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')));
                  }
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('cancelled')),
                  );
                },
              ),
            ],
          ),
        )
      ],
    );
  }
}
