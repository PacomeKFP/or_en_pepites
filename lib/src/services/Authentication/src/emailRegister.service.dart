part of auth.service;

Future<UserCredential?> emailPasswordRegister(
    List<String> errors, Map<String, String> data) async {
  FirebaseAuth auth = FirebaseAuth.instance;
  try {
    var credential = await auth.createUserWithEmailAndPassword(
      email: data['email']!.toString()..trim(),
      password: data['password']!.toString().trim(),
    );
    User? user = credential.user;

    ///saving the user name too
    await user!.updateDisplayName(data['name']);
    await user.reload().then((value) => null);
    user = auth.currentUser;

    return credential;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      errors.add(
          "Ce mot de passe est trop peu securisé, veuillez en fournir un autre");
    } else if (e.code == 'email-already-in-use') {
      errors.add(
          "Un compte avec cet email exite déja,\n S'il s'agit du votre, essayez de vous connecter avec");
    }
  } catch (e) {
    errors.add(
        "Une erreur est survunue, verifier votre connexion internet et reéssayez.\n Si cela persiste, veuillez contacter le developpeur de l'application.");
  }
  return null;
}
