part of 'contacts_cubit.dart';

@immutable
abstract class ContactsState {}

class ContactsInitial extends ContactsState {}
class ContactsLoaded extends ContactsState {
  final List<Contact>contacts;

  ContactsLoaded(this.contacts);
}
class ContactsLoading extends ContactsState {}
