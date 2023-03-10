import 'package:flutter/material.dart';
import 'package:or_en_pepite/src/logic/blocs.dart';
import 'configs/configs.dart';
import 'router/app_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Application extends StatelessWidget {
  final _appRouter = AppRouter(checkAuthState: CheckAuthState());
  Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => AuthenticationBloc()),
          BlocProvider(create: (context) => TabsManagerBloc()),
        ],
        child: MaterialApp.router(
          routerDelegate: _appRouter.delegate(),
          routeInformationParser: _appRouter.defaultRouteParser(),
          theme: AppTheme.lightTheme,
          debugShowCheckedModeBanner: false,
        ));
  }
}
