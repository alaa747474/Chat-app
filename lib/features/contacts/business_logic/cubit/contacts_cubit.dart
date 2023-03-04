import 'package:bloc/bloc.dart';
import 'package:chat_app/features/contacts/data/repository/contacts_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_contacts/flutter_contacts.dart';

part 'contacts_state.dart';

class ContactsCubit extends Cubit<ContactsState> {
  ContactsCubit(this._contactsRepository) : super(ContactsInitial());
  final ContactsRepository _contactsRepository;
  getContacts() {
    try {
      emit(ContactsLoading());
      _contactsRepository.getContacts().then((contacts) {
        emit(ContactsLoaded(contacts));
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
