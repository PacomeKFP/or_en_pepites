import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:or_en_pepite/src/core/configs/configs.dart';
import 'package:or_en_pepite/src/logic/blocs.dart';
import 'package:or_en_pepite/src/models/models.dart';
import 'package:or_en_pepite/src/services/Authentication/Auth.service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SocialLoginButton extends StatelessWidget {
  final SocialButtons button;
  const SocialLoginButton({super.key, required this.button});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: InkWell(
            onTap: () => context.read<AuthenticationBloc>().add(
                AuthenticateUser(
                    authType: AuthType.authenticate,
                    authMethod: button.authMethod)),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border:
                    Border.all(color: Theme.of(context).colorScheme.secondary),
                color: button.bgColor,
                borderRadius: const BorderRadius.all(
                  Radius.circular(Dimens.radius),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: Dimens.halfPadding),
                    child: button.icon,
                  ),
                  const SizedBox(width: Dimens.space),
                  Text(
                    button.text,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: button.txtColor,
                        ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
