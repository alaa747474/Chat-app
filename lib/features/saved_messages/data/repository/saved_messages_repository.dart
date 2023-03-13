import 'package:chat_app/features/chat/data/model/message.dart';
import 'package:chat_app/features/saved_messages/data/repository/base_saved_messages_repository.dart';
import 'package:hive/hive.dart';

class SaveMessagesRepository extends BaseSaveMessagesRepository {
  final String boxName = 'SavedMessages';
  @override
  Future<Box> openBox() async {
    Box box = await Hive.openBox<Message>(boxName);
    return box;
  }

  @override
  Future<void> removeMessage(Box box, Message message) async {
    await box.delete(message.messageId);
  }

  @override
  Future<void> saveMessage(Box box, Message message) async {
    await box.put(message.messageId, message);
  }

  @override
  List<Message> getSavedMessages(Box box) {
    return box.values.toList() as List<Message>;
  }
}
