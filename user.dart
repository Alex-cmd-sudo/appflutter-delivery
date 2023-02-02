import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {

    String id;
    String email;
    String name;
    String lastname;
    String telephone;
    String image;
    String password;

    User({
        required this.id,
        required this.email,
        required this.name,
        required this.lastname,
        required this.telephone,
        required this.image,
        required this.password,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        email: json["email"],
        name: json["name"],
        lastname: json["lastname"],
        telephone: json["telephone"],
        image: json["image"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "name": name,
        "lastname": lastname,
        "telephone": telephone,
        "image": image,
        "password": password,
    };
}
