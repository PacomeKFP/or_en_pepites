import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:or_en_pepite/src/models/models.dart';
import 'package:or_en_pepite/src/core/configs/configs.dart';
import '../../logic/blocs.dart';
import 'Components/Email.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Components/Socials.dart';

class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({super.key});

  @override
  State<AuthenticationPage> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  AuthType authType = AuthType.register;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<SocialButtons> buttons = [
      SocialButtons.google,
    ];

    return Scaffold(
        body: SafeArea(
      child: BlocProvider(
        create: (context) => AuthenticationBloc(),
        child: Container(
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
              BlocBuilder<AuthenticationBloc, AuthenticationState>(
                  builder: (context, state) {
                if ((state as AuthenticationInitial).authState ==
                    AuthState.authenticated) {
                  context.router.pushNamed('/');
                }
                if (state.authErrors.isNotEmpty) {}
                return Column(
                    children:
                        state.authErrors.map((error) => Text(error)).toList());
              }),
              EmailPasswordAuth(authType: authType),
              const SizedBox(height: 35),
              Column(
                  children: buttons
                      .map((button) => SocialLoginButton(
                            button: button,
                          ))
                      .toList()),
              if (authType != AuthType.resetPassword) toggleLoginRegButton(),
              toggleResetPaswword()
            ],
          )),
        ),
      ),
    ));
  }

  TextButton toggleLoginRegButton() => TextButton(
        onPressed: () {
          setState(() {
            authType =
                authType == AuthType.login ? AuthType.register : AuthType.login;
          });
        },
        child: Text(
            authType == AuthType.resetPassword
                ? AuthType.login.attachedText
                : authType.attachedText,
            style: GoogleFonts.roboto(
                fontSize: 16, color: AppColors.light().gold)),
      );
  TextButton toggleResetPaswword() {
    return TextButton(
      onPressed: () {
        setState(() {
          authType = authType == AuthType.login
              ? AuthType.resetPassword
              : AuthType.login;
        });
      },
      child: Text(authType == AuthType.resetPassword ?"Me Connecter " :AuthType.resetPassword.attachedText,
          style:
              GoogleFonts.roboto(fontSize: 16, color: AppColors.light().gold)),
    );
  }
}
