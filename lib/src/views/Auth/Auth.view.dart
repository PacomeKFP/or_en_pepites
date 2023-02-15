import 'package:flutter/material.dart';
import 'package:or_en_pepite/src/core/configs/configs.dart';
import 'package:or_en_pepite/src/models/models.dart';
import 'components/Email.dart';

import 'components/Socials.dart';

class AuthenticationPage extends StatelessWidget {
  const AuthenticationPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    AuthType authType = AuthType.register;
    List<SocialButtons> buttons = [
      SocialButtons.google,
      SocialButtons.facebookNew
    ];
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(title: Center(child: Text(AppStrings.appName))),
          body: Container(
            padding: const EdgeInsets.only(
              left: 30,
              top: 60,
              right: 30,
              bottom: 20,
            ),
            height: size.height,
            width: size.width,
            child: SingleChildScrollView(
                child: Column(
              children: [
                EmailPasswordAuth(authType: authType),
                const SizedBox(height: 35),
                Column(
                    children: buttons
                        .map((button) => SocialLoginButton(
                              button: button,
                            ))
                        .toList())
              ],
            )),
          )),
    );
  }
}
