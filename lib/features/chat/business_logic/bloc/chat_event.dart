part of 'chat_bloc.dart';

@immutable
abstract class ChatEvent {}

class LoadMessages extends ChatEvent {
  final String reciverUid;

  LoadMessages(this.reciverUid);
}

class UpdateMessages extends ChatEvent {
  final List<Message> messages;
  UpdateMessages(this.messages);
}

class LoadChatContacts extends ChatEvent {
}

class UpdateChatContacts  extends ChatEvent {
  final List<ChatContact>chatContacts;
  UpdateChatContacts (this.chatContacts);
}
class SendMessage extends ChatEvent {
  final String messageText;
  final String reciverUid;
  SendMessage(this.messageText, this.reciverUid);
}

class SaveChatContact extends ChatEvent {
  final ChatContact chatContact;
  final String reciverUid;
  SaveChatContact(this.chatContact, this.reciverUid);
}


