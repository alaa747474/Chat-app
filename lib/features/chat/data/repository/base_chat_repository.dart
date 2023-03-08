import 'package:chat_app/features/chat/data/model/chat_contact.dart';
import 'package:chat_app/features/chat/data/model/message.dart';

abstract class BaseChatRepository {
  Future<void> sendMessage({
    required String messageText,
    required String reciverUid,
  });
  Stream<List<Message>> getMessages({required String reciverUid});
  Future<void>saveChatContact({required String reciverUid,required ChatContact chatContact});
  Stream<List<ChatContact>>getChatContacts();
}
