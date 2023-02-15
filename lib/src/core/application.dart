import 'package:flutter/material.dart';
import 'configs/configs.dart';
import 'router/app_router.dart';
        
class Application extends StatelessWidget {   
  final _appRouter = AppRouter();

  Application({super.key});   
      
  @override      
  Widget build(BuildContext context){      
    return MaterialApp.router(      
      routerDelegate: _appRouter.delegate(),      
      routeInformationParser: _appRouter.defaultRouteParser(),    
      theme: AppTheme.lightTheme, 
      debugShowCheckedModeBanner: false, 
    );      
  }      
}      