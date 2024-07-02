class ChatModel {
  ChatModel({
    this.results,
  });

  ChatModel.fromJson(dynamic json) {
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(Results.fromJson(v));
      });
    }
  }
  List<Results>? results;
}

class Results {
  Results({
    this.id,
    this.members,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.lastMesssage,
  });

  Results.fromJson(dynamic json) {
    id = json['_id'];
    if (json['members'] != null) {
      members = [];
      json['members'].forEach((v) {
        members?.add(Members.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    lastMesssage = json['lastMesssage'];
  }
  String? id;
  List<Members>? members;
  String? createdAt;
  String? updatedAt;
  num? v;
  String? lastMesssage;
}

class Members {
  Members({
    this.id,
    this.name,
    this.role,
  });

  Members.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    role = json['role'];
  }
  String? id;
  String? name;
  String? role;
}
