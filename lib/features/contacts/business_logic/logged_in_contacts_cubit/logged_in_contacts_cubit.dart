import 'package:bloc/bloc.dart';
import 'package:chat_app/features/contacts/data/repository/contacts_repository.dart';
import 'package:chat_app/features/settings/data/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_contacts/contact.dart';
import 'package:meta/meta.dart';

part 'logged_in_contacts_state.dart';

class LoggedInContactsCubit extends Cubit<LoggedInContactsState> {
  LoggedInContactsCubit(this._contactsRepository)
      : super(LoggedInContactsInitial());
  final ContactsRepository _contactsRepository;
  getUsers() async {
    await _contactsRepository.getAllUsers().then((users) {
      emit(LoggedInContactsLoaded(users));
    });
  }

  List<UserModel> getListOfLoggedInContacts(
      {required List<Contact> contacts, required List<UserModel> users}) {
    List<UserModel> loggedInContacts = [];
    for (var contact in contacts) {
      final list = users
          .where((element) =>
              element.phoneNumber.replaceAll('+2', '') ==
              contact.phones[0].number)
          .skipWhile((value) =>
              value.phoneNumber ==
              FirebaseAuth.instance.currentUser!.phoneNumber);
      if (list.isNotEmpty) {
        loggedInContacts.addAll(list);
      }
    }
    return loggedInContacts;
  }

  getCurrentUserData() {
    if (state is LoggedInContactsLoaded) {
      return (state as LoggedInContactsLoaded).users.firstWhere(
          (element) => element.uid == FirebaseAuth.instance.currentUser!.uid);
    }
  }
}
