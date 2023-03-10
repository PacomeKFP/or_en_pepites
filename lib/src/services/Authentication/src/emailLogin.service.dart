part of auth.service;

Future<UserCredential?> emailPasswordLogin(
    List<String> errors, Map<String, String> data) async {
  try {
    return await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: data['email']!,
      password: data['password']!,
    );
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      errors.add("Aucun utilisateur n'existe pour cet email.");
    } else if (e.code == 'wrong-password') {
      errors.add("Mot de passe incorrect pour cet utilisateur.");
    }
  } catch (e) {
    errors.add(
        "Une erreur est survunue, verifier votre connexion internet et reéssayez.\n Si cela persiste, veuillez contacter le developpeur de l'application.");
  }
  return null;
}
