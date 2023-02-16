import 'package:flutter/material.dart';
import 'package:or_en_pepite/src/core/configs/configs.dart';

import 'Components/ChangePassword.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: Dimens.doublePadding),
          width: double.infinity,
          height: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: Dimens.tripleSpace),
                  child: Text(
                    "Mon Compte",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: AppColors.light().gold),
                  ),
                ),

                ///TODO: verifier le type d'auth:  SOCIAL ou EMAIL-PASS
                const ChangePasswordComponent()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
