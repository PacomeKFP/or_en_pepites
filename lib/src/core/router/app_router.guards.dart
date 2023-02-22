part of 'app_router.dart';

class CheckAuthState extends AutoRouteGuard {
  CheckAuthState();
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    // AuthenticationBloc authBloc = AuthenticationBloc();
    // authBloc.add(InitAuthentication());

    // final authBlocState = authBloc.state as AuthenticationInitial;

    // if (authBlocState.authState != AuthState.authenticated ||
    //     authBlocState.currentUser == null) {
    //   authBloc.add(LogoutUser());
    //   print("Not auth, and redirected by route guard");
    //   router.push(AuthenticationRoute());
    //   return;
    // }
    // if (['/auth', 'auth'].contains(resolver.route.path)) {
    //   router.push(UserHomeRoute());
    //   return;
    // }

    if (FirebaseAuth.instance.currentUser == null) {
      print("Not auth, and redirected by route guard");
      // router.
      
      router.push(AuthenticationRoute());
      return;
    }
    if (['/auth', 'auth'].contains(resolver.route.path)) {
      // router.redirect('/');
      router.push(UserHomeRoute());
      return;
    }
    resolver.next(true);
  }
}
