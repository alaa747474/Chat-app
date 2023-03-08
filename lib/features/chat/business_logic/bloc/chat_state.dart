part of 'chat_bloc.dart';

@immutable
abstract class ChatState {}

class ChatInitial extends ChatState {}
class MessagesLoaded extends ChatState {
  final List<Message>messages;

  MessagesLoaded(this.messages);
}
class ChatContactsLoaded extends ChatState {
  final List<ChatContact>chatContacts;

  ChatContactsLoaded (this.chatContacts);
}

