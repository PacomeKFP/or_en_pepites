part of 'app_router.dart';

class CheckAuthState extends AutoRouteGuard {
  CheckAuthState();
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
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
