import 'package:chat_app/core/services/firestore_service.dart';
import 'package:chat_app/core/utils/contants.dart';
import 'package:chat_app/features/contacts/data/repository/base_contacts_repository.dart';
import 'package:chat_app/features/settings/data/model/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_contacts/flutter_contacts.dart';

class ContactsRepository extends BaseContactsRepository {
  final FirestoreService _firestoreService;
  final strings = ConstantStrings.instance;
  ContactsRepository(this._firestoreService);
  @override
  Future<List<Contact>> getContacts() async {
    List<Contact> contacts = [];
    try {
      if (await FlutterContacts.requestPermission()) {
        contacts = await FlutterContacts.getContacts(withProperties: true);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return contacts;
  }

  @override
  Future<List<UserModel>> getAllUsers() {
    return _firestoreService.getCollectionData(
        collection: 'users',
        builder: (user) => UserModel.fromJson(user!));
  }
}
