// To parse this JSON data, do
//
//     final modelUser = modelUserFromJson(jsonString);

import 'dart:convert';

ModelUser modelUserFromJson(String str) => ModelUser.fromJson(json.decode(str));

String modelUserToJson(ModelUser data) => json.encode(data.toJson());

class ModelUser {
    bool isSuccess;
    String message;
    List<User> data;

    ModelUser({
        required this.isSuccess,
        required this.message,
        required this.data,
    });

    factory ModelUser.fromJson(Map<String, dynamic> json) => ModelUser(
        isSuccess: json["isSuccess"],
        message: json["message"],
        data: List<User>.from(json["data"].map((x) => User.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "isSuccess": isSuccess,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class User {
    String id;
    String username;
    String email;
    String password;
    String fullname;
    DateTime tglDaftar;

    User({
        required this.id,
        required this.username,
        required this.email,
        required this.password,
        required this.fullname,
        required this.tglDaftar,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        username: json["username"],
        email: json["email"],
        password: json["password"],
        fullname: json["fullname"],
        tglDaftar: DateTime.parse(json["tgl_daftar"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
        "password": password,
        "fullname": fullname,
        "tgl_daftar": tglDaftar.toIso8601String(),
    };
}
