library auth.service;

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:or_en_pepite/src/models/models.dart';

import 'dart:developer';

part 'src/emailLogin.service.dart';
part 'src/emailRegister.service.dart';
part 'src/facebookAuth.service.dart';
part 'src/googleAuth.service.dart';

class AuthenticationService {
  AuthenticationService();

  void logout() async => await FirebaseAuth.instance.signOut();

  Future<UserCredential?> authenticateUser(
      AuthType authType,
      AuthMethod authMethod,
      Map<String, String>? data,
      List<String> errors) async {
    errors = [];

    if (authMethod == AuthMethod.google) {
      return await signInWithGoogle(errors);
    }
    if (authMethod == AuthMethod.facebook) {
      return await signInWithFacebook(errors);
    }
    if (authType == AuthType.register) {
      return await emailPasswordRegister(errors, data!);
    }
    if (authType == AuthType.login) {
      return await emailPasswordLogin(errors, data!);
    }
  }

  static Future<bool> updateUserName(String newName) async {
    try {
      await FirebaseAuth.instance.currentUser!.updateDisplayName(newName);
      await FirebaseAuth.instance.currentUser!.reload();
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<bool> updateUserPassword(String newName) async {
    try {
      await FirebaseAuth.instance.currentUser!.updatePassword(newName);
      await FirebaseAuth.instance.currentUser!.reload();
      return true;
    } catch (e) {
      return false;
    }
  }
}
