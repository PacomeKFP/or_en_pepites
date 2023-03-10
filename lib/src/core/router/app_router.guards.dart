part of 'app_router.dart';

class CheckAuthState extends AutoRouteGuard {
  CheckAuthState();
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    if (FirebaseAuth.instance.currentUser == null) {
      // router.
      router.push(const AuthenticationRoute());
      return;
    }
    if (['/auth', 'auth'].contains(resolver.route.path)) {
      // router.redirect('/');
      router.push(const UserHomeRoute());
      return;
    }
    resolver.next(true);
  }
}
