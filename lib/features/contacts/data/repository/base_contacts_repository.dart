import 'package:chat_app/features/settings/data/model/user_model.dart';
import 'package:flutter_contacts/flutter_contacts.dart';

abstract class BaseContactsRepository {
  Future<List<Contact>>getContacts();
  Future<List<UserModel>>getAllUsers();
}