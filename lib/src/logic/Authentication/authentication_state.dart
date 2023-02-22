part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationState {}

class AuthenticationInitial extends AuthenticationState {
  
  /// le status d'autentification, initailement inconnu,
  /// mais qui peu passer à authenticated ou unAuthenticated.
  final AuthState authState;

  /// L'utilisateur courant, celui qui est actuellement connecté.
  final User? currentUser;

  /// Liste des erreurs qui aparaitront pendant l'authentification.
  final List<String> authErrors;

  AuthenticationInitial({
    this.authState = AuthState.unknown,
    this.currentUser,
    this.authErrors = const [],
  });
}
