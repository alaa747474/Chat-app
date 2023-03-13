part of 'saved_messages_bloc.dart';

@immutable
abstract class SavedMessagesEvent {}

class SaveMessage extends SavedMessagesEvent {
  final String messageId;
  final Message message;

  SaveMessage(this.messageId, this.message);
}

class RemoveMessage extends SavedMessagesEvent {
  final Message message;

  RemoveMessage(this.message);
}
class LoadSavedMessage extends SavedMessagesEvent {
}
