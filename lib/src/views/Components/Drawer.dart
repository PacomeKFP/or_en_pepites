import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:or_en_pepite/src/core/configs/configs.dart';
import 'package:or_en_pepite/src/logic/Authentication/authentication_bloc.dart';
import 'package:or_en_pepite/src/models/models.dart';
import 'package:or_en_pepite/src/models/types/navigation.dart';
import 'package:auto_route/auto_route.dart';
import 'package:or_en_pepite/src/services/Authentication/Auth.service.dart';
import 'package:or_en_pepite/src/views/Auth/Auth.view.dart';

class DrawerComponent extends StatelessWidget {
  const DrawerComponent({super.key});

  @override
  Widget build(BuildContext context) {
    // UserModel user = UserModel(
    //     name: 'Pacome Kengali Fegue',
    //     email: 'pacomekengafe@gmail.com',
    //     facebook: 'facebook.com/pacomekfp');
    User user = FirebaseAuth.instance.currentUser!;

    return Drawer(
      width: MediaQuery.of(context).size.width * 0.75,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Dimens.radius),
          bottomLeft: Radius.circular(Dimens.radius * 2),
        ),
      ),
      backgroundColor: Colors.white,
      child: Column(
        // Important: Remove any padding from the ListView.
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          //adding user profile
          UserAccountsDrawerHeader(
            decoration:
                BoxDecoration(color: AppColors.light().gold.withOpacity(0.8)),
            accountName: Text(
              user.displayName!,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            accountEmail: Text(
              user.email!,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            currentAccountPicture: CircleAvatar(
              radius: 400,
              backgroundColor: Colors.white30,
              child: Image.asset(user.photoURL ?? 'assets/images/profil.png'),
            ),
          ),
          //adding options
          ...DrawerOptions.values
              .map(
                (option) => ListTile(
                  leading: Icon(
                    option.icon,
                  ),
                  title: Text(
                    option.label,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: AppColors.light().gold),
                  ),
                  onTap: () {
                    //TODO push to the in option.path location
                    context.router.pushNamed(option.path);
                  },
                ),
              )
              .toList(),

          const SizedBox(height: 25),
          ListTile(
            leading: const Icon(Icons.logout_rounded, color: Colors.amber),
            title: Text(
              "Se deconnecter",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: AppColors.light().gold),
            ),
            onTap: () {
              FirebaseAuth.instance.signOut().then((value) =>
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Vous avez eté deconnecté avec succes'))));
              context.router.pushNamed('/auth');
            },
          ),
          const SizedBox(height: 50),

          //application info
          AboutListTile(
            icon: const Icon(
              Icons.info,
            ),
            applicationIcon: const Icon(
              Icons.local_play,
            ),
            applicationName: AppStrings.appName,
            applicationVersion: '0.0.01',
            aboutBoxChildren: const [],
            applicationLegalese: '© 2023 Company',
            child: Text(
              "À propos...",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: AppColors.light().gold),
            ),
          ),
        ],
      ),
    );
  }
}
