part of auth.service;

// Future<UserCredential?> signInWithFacebook(List<String> errors) async {
//   try {
//     // Trigger the sign-in flow
//     final LoginResult loginResult = await FacebookAuth.instance.login();

//     // Create a credential from the access token
//     final OAuthCredential facebookAuthCredential =
//         FacebookAuthProvider.credential(loginResult.accessToken!.token);

//     // Once signed in, return the UserCredential
//     return await FirebaseAuth.instance
//         .signInWithCredential(facebookAuthCredential);
//   } catch (e) {
//     errors.add(e.toString());
//     return null;
//   }
// }
