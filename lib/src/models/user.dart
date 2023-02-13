import 'dart:convert';

import 'package:udemy_fluter_delivery/src/models/Rol.dart';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {

    String? id;
    String? email;
    String? name;
    String? lastname;
    String? telephone;
    String? image;
    String? password;
    String? sessionToken;    
    List<Rol>? roles = [];

    User({
        this.id,
        this.email,
        this.name,
        this.lastname,
        this.telephone,
        this.image,
        this.password,
        this.sessionToken,
        this.roles
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        email: json["email"],
        name: json["name"],
        lastname: json["lastname"],
        telephone: json["telephone"],
        image: json["image"],
        password: json["password"],
        sessionToken: json["session_token"],
        roles: json["roles"] == null ? [] : List<Rol>.from(json["roles"].map((model) => Rol.fromJson(model)))
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "name": name,
        "lastname": lastname,
        "telephone": telephone,
        "image": image,
        "password": password,
        "session_token": sessionToken,
        "roles": roles
    };
}
