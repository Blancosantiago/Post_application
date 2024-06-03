import 'dart:convert';

class GetCommentsOutput {
  final int? postId;
  final int? id;
  final String? name;
  final String? email;
  final String? body;

  GetCommentsOutput({
    this.postId,
    this.id,
    this.name,
    this.email,
    this.body,
  });

  factory GetCommentsOutput.fromJson(String str) =>
      GetCommentsOutput.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GetCommentsOutput.fromMap(Map<dynamic, dynamic> json) =>
      GetCommentsOutput(
        postId: json["postId"],
        id: json["id"],
        name: json["name"],
        email: json["email"],
        body: json["body"],
      );

  Map<String, dynamic> toMap() => {
        "postId": postId,
        "id": id,
        "name": name,
        "email": email,
        "body": body,
      };
}
