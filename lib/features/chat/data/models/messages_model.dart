class MessagesModel {
  MessagesModel({
      this.message, 
      this.results,});

  MessagesModel.fromJson(dynamic json) {
    message = json['message'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(Results.fromJson(v));
      });
    }
  }
  String? message;
  List<Results>? results;

}

class Results {
  Results({
      this.content, 
      this.sender, 
      this.createdAt, 
      this.updatedAt,});

  Results.fromJson(dynamic json) {
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