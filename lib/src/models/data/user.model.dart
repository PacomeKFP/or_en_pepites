part of '../models.dart';

class UserModel {
  String picture;
  String? name;
  String? email;
  String? twitter;
  String? facebook;
  List<String> preferences;

  UserModel(
      {this.name,
      this.email,
      this.facebook,
      this.twitter,
      this.picture = 'images/profil.png',
      this.preferences = const []});
}

enum UserAttr {
  name,
  email,
  twitter,
  facebook,
  preferences;
  
}
