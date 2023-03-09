
import 'package:chat_app/core/services/firestore_service.dart';
import 'package:chat_app/core/utils/contants.dart';
import 'package:chat_app/features/chat/data/model/chat_contact.dart';
import 'package:chat_app/features/chat/data/model/message.dart';
import 'package:chat_app/features/chat/data/repository/base_chat_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uuid/uuid.dart';

class ChatRepository extends BaseChatRepository {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;
  final FirestoreService _service;
  ConstantStrings strings = ConstantStrings.instance;

  ChatRepository(this._firestore, this._auth, this._service);
  @override
  Future<void> sendMessage(
      {required String messageText, required String reciverUid}) async {
    Message message = Message(
        message: messageText,
        timeSent: DateTime.now(),
        reciverUid: reciverUid,
        senderUid: _auth.currentUser!.uid,
        messageId: const Uuid().v1());
    _service.setDataToSubCollection(
        firstCollection: strings.chatCollection,
        secondCollection: strings.messagesCollection,
        firstDoc: _auth.currentUser!.uid,
        secondDoc: reciverUid,
        thirdDoc: message.messageId,
        data: message.toJson());
    _service.setDataToSubCollection(
        firstCollection: strings.chatCollection,
        secondCollection: strings.messagesCollection,
        firstDoc: reciverUid,
        secondDoc: _auth.currentUser!.uid,
        thirdDoc: message.messageId,
        data: message.toJson());
  }

  @override
  Stream<List<Message>> getMessages({required String reciverUid}) {
    return _firestore
        .collection(strings.usersCollection)
        .doc(_auth.currentUser!.uid)
        .collection(strings.chatCollection)
        .doc(reciverUid)
        .collection(strings.messagesCollection)
        .orderBy('timeSent')
        .snapshots()
        .map((event) {
      return event.docs.map((e) => Message.fromJson(e.data())).toList();
    });
  }

  @override
  Stream<List<ChatContact>> getChatContacts() {
    return _firestore
        .collection(strings.usersCollection)
        .doc(_auth.currentUser!.uid)
        .collection(strings.chatCollection)
        .snapshots().map((event) {
          return event.docs.map((e) => ChatContact.fromJson(e.data())).toList();
        } );
  }

  @override
  Future<void> saveChatContact(
      {required String reciverUid, required ChatContact senderChatContact,required ChatContact reciverChatContact}) async {
    await _firestore
        .collection(strings.usersCollection)
        .doc(_auth.currentUser!.uid)
        .collection(strings.chatCollection)
        .doc(reciverUid)
        .set(senderChatContact.toJson());
    await _firestore
        .collection(strings.usersCollection)
        .doc(reciverUid)
        .collection(strings.chatCollection)
        .doc(_auth.currentUser!.uid)
        .set(reciverChatContact.toJson());

  }
}
