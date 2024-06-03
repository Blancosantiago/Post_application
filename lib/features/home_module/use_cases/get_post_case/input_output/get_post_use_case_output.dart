import 'dart:convert';

class GetPostOutput {
  final int? userId;
  final int? id;
  final String? title;
  final String? body;

  GetPostOutput({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  factory GetPostOutput.fromJson(String str) =>
      GetPostOutput.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GetPostOutput.fromMap(Map<String, dynamic> json) => GetPostOutput(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toMap() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };
}
