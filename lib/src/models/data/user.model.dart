part of '../models.dart';

class UserModel {
  String uid;
  String photoURL;
  String displayName;
  String? email;
  String? twitter;
  String? facebook;
  List<String> preferences;

  UserModel(
      {required this.uid,
      required this.displayName,
      this.email,
      this.facebook,
      this.twitter,
      this.photoURL = 'assets/images/profil.png',
      this.preferences = const []});

  Map<String, String> toJson() => {
        'uid': uid,
        'displayName': displayName,
        'photoURL': photoURL,
        'email': email ?? '',
      };

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        photoURL: json['photoURL'],
        uid: json['uid'],
        displayName: json['displayName'],
        email: json['email'],
      );
}

enum UserAttr {
  name,
  email,
  twitter,
  facebook,
  preferences;
}
