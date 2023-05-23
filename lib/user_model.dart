import 'dart:convert';

// {"id":1,"username":"atuny0","email":"atuny0@sohu.com","firstName":"Terry","lastName":"Medhurst","gender":"male","image":"https://robohash.org/hicveldicta.png","token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidXNlcm5hbWUiOiJhdHVueTAiLCJlbWFpbCI6ImF0dW55MEBzb2h1LmNvbSIsImZpcnN0TmFtZSI6IlRlcnJ5IiwibGFzdE5hbWUiOiJNZWRodXJzdCIsImdlbmRlciI6Im1hbGUiLCJpbWFnZSI6Imh0dHBzOi8vcm9ib2hhc2gub3JnL2hpY3ZlbGRpY3RhLnBuZyIsImlhdCI6MTY4NDg0OTU1MiwiZXhwIjoxNjg0ODUzMTUyfQ.NaZa7xMzexk4GJmd0hRuEM_fgIEu4obmfodS6tbxguw"}

User userFromJson(String str) => User.fromJson(json.decode(str));

String? userToJson(User data) => json.encode(data.toJson());

class User {
  int? id;
  String? username;
  String? email;
  String? firstName;
  String? lastName;
  String? gender;
  String? image;
  String? token;
  String? message;

  User({
    this.id,
    this.username,
    this.email,
    this.firstName,
    this.lastName,
    this.gender,
    this.image,
    this.token,
    this.message,
  });

  factory User.fromJson(Map<String?, dynamic> json) => User(
      id: json["id"],
      username: json["username"],
      email: json["email"],
      firstName: json["firstName"],
      lastName: json["lastnName"],
      gender: json["gender"],
      image: json["image"],
      token: json["token"],
      message: json['message']);

  Map<String?, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
        "firstName": firstName,
        "lastName": lastName,
        "gender": gender,
        "image": image,
        "token": token,
        "message": message,
      };
}
