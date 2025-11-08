
class MessageModel {
  final String message;
  // final Timestamp timeStamp;

  MessageModel({required this.message});

  factory MessageModel.fromJson(jsonData) {
    return MessageModel(message: jsonData['message'], 
    // timeStamp: jsonData['timeStamp']
    );
  }
}
