
import 'package:bloc/bloc.dart';
import 'package:chat_app/features/chat/data/model/chat_contact.dart';
import 'package:chat_app/features/chat/data/model/message.dart';
import 'package:chat_app/features/chat/data/repository/chat_repository.dart';
import 'package:meta/meta.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {

  final ChatRepository _chatRepository;
  ChatBloc(this._chatRepository) : super(ChatInitial()) {
    on<LoadMessages>(_loadMessages);
    on<UpdateMessages>(_updateMessages);
    on<SendMessage>(_sendMessage);
    on<SaveChatContact>(_saveChatContact);
    on<LoadChatContacts>(_loadChatContacts);
    on<UpdateChatContacts>(_updateChatContacts);
  }

  _loadMessages(LoadMessages event, Emitter<ChatState> emit) {
    _chatRepository
        .getMessages(reciverUid: event.reciverUid)
        .listen((messages) => add(UpdateMessages(messages)));
  }
  _updateMessages(UpdateMessages event, Emitter<ChatState> emit){
    emit(MessagesLoaded(event.messages));
  }

  
  _loadChatContacts(LoadChatContacts event, Emitter<ChatState> emit) {
    _chatRepository.getChatContacts().listen((event) =>add(UpdateChatContacts(event)));
  }
  _updateChatContacts(UpdateChatContacts event, Emitter<ChatState> emit){
    emit(ChatContactsLoaded(event.chatContacts));
  }

  _sendMessage(SendMessage event,Emitter<ChatState>emit){
    _chatRepository.sendMessage(messageText: event.messageText, reciverUid: event.reciverUid);
  }
  _saveChatContact(SaveChatContact event,Emitter<ChatState>emit){
    _chatRepository.saveChatContact(reciverUid: event.reciverUid, chatContact:event.chatContact );
  }

}
