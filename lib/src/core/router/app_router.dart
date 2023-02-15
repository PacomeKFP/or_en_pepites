import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:or_en_pepite/src/views/Auth/Auth.view.dart';

part 'app_router.gr.dart';      
        
@MaterialAutoRouter(              
  replaceInRouteName: 'Page,Route',              
  routes: <AutoRoute>[              
    AutoRoute(page: AuthenticationPage, initial: true),       
  ],              
)              
// extend the generated private router        
class AppRouter extends _$AppRouter{}       