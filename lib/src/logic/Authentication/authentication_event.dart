part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationEvent {}
class InitAuthentication extends AuthenticationEvent {}
class AuthenticateUser extends AuthenticationEvent{
  final AuthType authType;
  final AuthMethod authMethod;
  final Map<String, String>? data;

  AuthenticateUser({required this.authType, required this.authMethod, this.data});
  
}
class ReloadUser extends AuthenticationEvent{}
class LogoutUser extends AuthenticationEvent{}