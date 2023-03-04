import 'package:flutter_contacts/flutter_contacts.dart';

abstract class BaseContactsRepository {
  Future<List<Contact>>getContacts();
}