import 'package:chat_app/features/chat/data/model/message.dart';
import 'package:hive/hive.dart';

abstract class BaseSaveMessagesRepository {
   Future<Box> openBox();
  List<Message> getSavedMessages(Box box);
  Future<void> saveMessage(Box box, Message message);
  Future<void> removeMessage(Box box, Message message);
}