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
class SendMessage extends ChatEvent {
  final String messageText;
  final String reciverUid;

  SendMessage(this.messageText, this.reciverUid);
}
