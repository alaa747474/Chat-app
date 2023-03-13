
import 'package:hive/hive.dart';
part 'message.g.dart';

@HiveType(typeId: 1)
class Message {
  @HiveField(0)
  final String message;
  @HiveField(1)
  final DateTime timeSent;
  @HiveField(2)
  final String reciverUid;
  @HiveField(3)
  final String senderUid;
  @HiveField(4)
  final String messageId;
  Message({
    required this.message,
    required this.timeSent,
    required this.reciverUid,
    required this.senderUid,
    required this.messageId,
  });

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'timeSent': timeSent.millisecondsSinceEpoch,
      'reciverUid': reciverUid,
      'senderUid': senderUid,
      'messageId': messageId,
    };
  }

  factory Message.fromJson(Map<String, dynamic> map) {
    return Message(
      message: map['message'] ?? '',
      timeSent: DateTime.fromMillisecondsSinceEpoch(map['timeSent']),
      reciverUid: map['reciverUid'] ?? '',
      senderUid: map['senderUid'] ?? '',
      messageId: map['messageId'] ?? '',
    );
  }
  

}
