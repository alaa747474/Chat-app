part of 'user_auth_cubit.dart';

@immutable
abstract class UserAuthState {}

class UserAuthInitial extends UserAuthState {}
class UserLoggedInState extends UserAuthState{
final bool loggedIn;

  UserLoggedInState(this.loggedIn);
}