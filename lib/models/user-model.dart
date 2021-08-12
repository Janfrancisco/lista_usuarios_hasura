import 'dart:convert';

User userFromMap(String str) => User.fromMap(json.decode(str));

String userToMap(User data) => json.encode(data.toMap());

class User {
  User({
    this.name,
    this.email,
  });

  String name;
  String email;

  factory User.fromMap(Map<String, dynamic> json) => User(
        name: json["name"],
        email: json["email"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "email": email,
      };

  static List<User> fromJsonList(List list) {
    if (list == null) return null;
    return list.map((item) => User.fromMap(item)).toList();
  }
}
