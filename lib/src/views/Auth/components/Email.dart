import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:or_en_pepite/src/core/configs/configs.dart';
import 'package:or_en_pepite/src/models/models.dart';
import 'package:or_en_pepite/src/views/Components/TextFormField.dart';

import '../../../logic/Authentication/authentication_bloc.dart';

class EmailPasswordAuth extends StatefulWidget {
  final AuthType authType;
  const EmailPasswordAuth({super.key, required this.authType});

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
              widget.authType == AuthType.register
                  ? CustomTextField(
                      controller: controllers['full_name']!,
                      icon: Icons.account_circle_outlined,
                      label: 'Nom complet',
                      placedholder: 'Entrer votre nom ...',
                    )
                  : const SizedBox(height: 50),
              CustomTextField(
                controller: controllers['email']!,
                icon: Icons.mail_outline_rounded,
                label: 'Email',
                validators: [(v) => !EmailValidator.isValidEmail(v)],
                placedholder: 'Entrer votre email ...',
              ),
              if (widget.authType != AuthType.resetPassword)
                CustomTextField(
                  controller: controllers['password']!,
                  icon: Icons.key_sharp,
                  label: 'Mot de passe',
                  validators: widget.authType == AuthType.register
                      ? [
                          (v) =>
                              controllers['password_confirm']!.text !=
                              controllers['password']!.text
                        ]
                      : null,
                  placedholder: 'Entrer votre mot de passe ...',
                  isObscurable: true,
                ),
              widget.authType == AuthType.register
                  ? CustomTextField(
                      controller: controllers['password_confirm']!,
                      icon: Icons.key_rounded,
                      validators: [
                        (v) =>
                            controllers['password_confirm']!.text !=
                            controllers['password']!.text
                      ],
                      label: 'Confirmez votre mot de passe',
                      placedholder: 'Entrer votre mot de passe à nouveau...',
                      isObscurable: true,
                    )
                  : const SizedBox(height: 50),

              const SizedBox(height: 25),

              // Validation button
              BlocProvider(
                create: (context) => AuthenticationBloc(),
                child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
                  builder: (context, state) {
                    return BlocListener<AuthenticationBloc,
                        AuthenticationState>(
                      listener: (context, state) {
                        if ((state as AuthenticationInitial).authState ==
                            AuthState.authenticated) {
                          print("email component");
                          context.router.pushNamed('/');
                        }
                        if (state.authErrors.isNotEmpty) {
                          state.authErrors.map((String error) =>
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                dismissDirection: DismissDirection.horizontal,
                                margin: const EdgeInsets.only(
                                    bottom: Dimens.minPadding),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        Dimens.radius * 2)),
                                showCloseIcon: true,
                                duration: const Duration(seconds: 6),
                                content: Text(
                                  error,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                backgroundColor: AppColors.light().error,
                              )));
                        }
                      },
                      child: InkWell(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 12),
                          decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.primary,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8))),
                          width: double.infinity,
                          alignment: Alignment.center,
                          child: Text(widget.authType.label,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary)),
                        ),
                        onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            context.read<AuthenticationBloc>().add(
                                  AuthenticateUser(
                                      authType: widget.authType,
                                      authMethod: AuthMethod.email,
                                      data: {
                                        "email":
                                            controllers['email']!.text.trim(),
                                        "password":
                                            controllers['password']!.text,
                                        "name": controllers['full_name']!.text
                                      }),
                                );

                            Timer(const Duration(seconds: 3), () {
                              if ((state as AuthenticationInitial).authState ==
                                  AuthState.authenticated) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content:
                                            Text("Authentification reussie")));
                              }
                            });
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text(
                                      "Echec de l'authentification veuillez reéssayez")),
                            );
                          }
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
