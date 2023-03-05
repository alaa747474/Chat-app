part of 'logged_in_contacts_cubit.dart';

@immutable
abstract class LoggedInContactsState {}

class LoggedInContactsInitial extends LoggedInContactsState {}
class LoggedInContactsLoaded extends LoggedInContactsState{
  final List<UserModel>users;

  LoggedInContactsLoaded(this.users);
}
