class MessagesModel {
  MessagesModel({
    this.message,
    this.results,
  });

  MessagesModel.fromJson(dynamic json) {
    message = json['message'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(MessageDetails.fromJson(v));
      });
    }
  }
  String? message;
  List<MessageDetails>? results;
}

class MessageDetails {
  MessageDetails({
    this.content,
    this.sender,
    this.createdAt,
    this.updatedAt,
  });

  MessageDetails.fromJson(dynamic json) {
    content = json['content'];
    sender = json['sender'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }
  String? content;
  String? sender;
  String? createdAt;
  String? updatedAt;
}
