import 'package:chat_app/features/chat/data/model/message.dart';

abstract class BaseChatRepository {
  Future<void> sendMessage({
    required String messageText,
    required String reciverUid,
  });
  Stream<List<Message>> getMessages({required String reciverUid});
}
