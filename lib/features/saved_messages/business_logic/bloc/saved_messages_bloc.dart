import 'package:bloc/bloc.dart';
import 'package:chat_app/features/chat/data/model/message.dart';
import 'package:chat_app/features/saved_messages/data/repository/saved_messages_repository.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

part 'saved_messages_event.dart';
part 'saved_messages_state.dart';

class SavedMessagesBloc extends Bloc<SavedMessagesEvent, SavedMessagesState> {
  final SaveMessagesRepository saveMessagesRepository;

  SavedMessagesBloc(this.saveMessagesRepository)
      : super(SavedMessagesInitial()) {
    on<SaveMessage>(_saveMessage);
    on<RemoveMessage>(_removeMessage);
    on<LoadSavedMessage>(_loadSavedMessages);
  }
  _loadSavedMessages(
      LoadSavedMessage event, Emitter<SavedMessagesState> emit) async {
    Box box = await saveMessagesRepository.openBox();
    List<Message> messages = saveMessagesRepository.getSavedMessages(box) ;
    emit(SavedMessagesLoaded(messages));
  }

  _saveMessage(SaveMessage event, Emitter<SavedMessagesState> emit) async {
    Box box = await saveMessagesRepository.openBox();
    saveMessagesRepository.saveMessage(box, event.message);
   if (state is SavedMessagesLoaded) {
      emit(SavedMessagesLoaded(List.from(
        (state as SavedMessagesLoaded).messages..add(event.message))));
   }
  }

  _removeMessage(RemoveMessage event, Emitter<SavedMessagesState> emit) async {
    Box box = await saveMessagesRepository.openBox();
    saveMessagesRepository.removeMessage(box, event.message);
    emit(SavedMessagesLoaded(List.from(
        (state as SavedMessagesLoaded).messages..remove(event.message))));
  }
}
