part of models;

enum AuthType {
  login,
  register;

  get label => this == login ? 'Se Connecter' : "S'inscrire";
}

enum SocialButtons {
  google,
  googleDark,
  facebookNew,
  github,
  twitter;

  String get label => [google, googleDark].contains(this)
      ? 'Google'
      : this == facebookNew
          ? 'Facebook'
          : this == github
              ? 'Github'
              : 'Twitter';
  Function() get loginMethod => () => debugPrint('Sign with $label');

  String get imageName => this == google
      ? 'google_light.png'
      : this == googleDark
          ? 'google_dark.png'
          : 'facebook_new.png';
  Widget get icon => [google, googleDark].contains(this)
      ? Image.asset(
          'logos/$imageName',
          width: 84,
        )
      : const Icon(
          Icons.facebook_rounded,
          color: Colors.white,
          size: 36,
        );
  Color get bgColor => this == google
      ? const Color(0xFFFFFFFF)
      : this == googleDark
          ? const Color(0xFF4285F4)
          : this == facebookNew
              ? const Color(0xFF1877f2)
              : const Color(0xFF444444);

  Color get txtColor => this == google
      ? const Color.fromRGBO(0, 0, 0, 0.54)
      : this == googleDark
          ? const Color(0xFFFFFFFF)
          : Colors.white;

  String get text => "Utiliser $label";
}
