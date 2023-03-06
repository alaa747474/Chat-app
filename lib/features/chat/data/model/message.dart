
class Message {
  final String message;
  final DateTime timeSent;
  final String reciverUid;
  final String senderUid;
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
