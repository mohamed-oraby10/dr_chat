class MessageModel {
  final String message;
  // final Timestamp timeStamp;
  final bool isUser;

  MessageModel({required this.isUser, required this.message});

  factory MessageModel.fromJson(jsonData) {
    return MessageModel(
      message: jsonData['message'],
      isUser: jsonData['isUser'],

      // timeStamp: jsonData['timeStamp']
    );
  }

  Map<String, dynamic> toJson() {
    return {'message': message, 'isUser': isUser};
  }
}
