part of 'saved_messages_bloc.dart';

@immutable
abstract class SavedMessagesState {}

class SavedMessagesInitial extends SavedMessagesState {}
class SavedMessagesLoaded extends SavedMessagesState {
  final List<Message>messages;

  SavedMessagesLoaded(this.messages);
}
