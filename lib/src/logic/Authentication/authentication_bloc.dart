import 'package:firebase_auth/firebase_auth.dart';
import 'package:or_en_pepite/src/services/Authentication/Auth.service.dart'
    show AuthenticationService;
import 'package:or_en_pepite/src/models/models.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
//
  AuthenticationBloc() : super(AuthenticationInitial()) {
    /// Pour initialiser notre bloc: status d'authentification et utilisateur courrant
    on<InitAuthentication>((event, emit) {
      User? fireUser = FirebaseAuth.instance.currentUser;
      if (fireUser == null) return add(LogoutUser());
      emit(AuthenticationInitial(
          authState: AuthState.authenticated, currentUser: fireUser));
    });
    add(InitAuthentication());

    on<ResetUserPassword>((event, emit) async {
      List<String> errors = [];
      await AuthenticationService.resetPassword(
          email: event.email, errorsLogger: errors).then((passwordReseted) => null);

    });

    on<ReloadUser>((event, emit) async {
      await FirebaseAuth.instance.currentUser!.reload();
    });

    //authentifier un utilisateur
    on<AuthenticateUser>((event, emit) async {
      List<String> errors = [];
      await AuthenticationService.authenticateUser(
          event.authType, event.authMethod, event.data, errors);
      User? user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        emit(AuthenticationInitial(
            authState: AuthState.unAuthenticated,
            currentUser: null,
            authErrors: errors));
        return;
      }

      emit(AuthenticationInitial(
          authState: AuthState.authenticated, currentUser: user));
    });

    on<LogoutUser>((event, emit) async {
      await FirebaseAuth.instance.signOut().then((value) => null);
      emit(AuthenticationInitial(authState: AuthState.unAuthenticated));
    });
  }
}
