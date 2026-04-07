class CommentResponse {
  int? id;
  String? body;
  int? postId;
  int? likes;
  User? user;

  CommentResponse({this.id, this.body, this.postId, this.likes, this.user});

  CommentResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    body = json['body'];
    postId = json['postId'];
    likes = json['likes'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['body'] = this.body;
    data['postId'] = this.postId;
    data['likes'] = this.likes;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? username;
  String? fullName;

  User({this.id, this.username, this.fullName});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    fullName = json['fullName'];
  }
    Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['fullName'] = this.fullName;
    return data;
  }
}