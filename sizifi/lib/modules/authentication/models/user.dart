import 'package:appwrite/models.dart';

class UserFields {
  static const String id = "\$id";
  static const String name = "name";
  static const String email = "email";
  static const String registrationDate = "registration";
  static const String preferences = "preferences";
}

class User {
  late String id;
  late String email;
  late int registration;
  late String name;
  late Preferences preferences;


  User(
      {required this.id,
      required this.email,
      required this.registration,
      required this.name,
      required this.preferences});

  User.fromJson(json) {
    id = json.$id;
    email = json.email;
    registration = DateTime.parse(json.registration).millisecondsSinceEpoch;
    name = json.name;
    preferences = json.prefs;
  }

  set password(String password) {}

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data[UserFields.id] = id;
    data[UserFields.email] = email;
    data[UserFields.registrationDate] = registration;
    data[UserFields.name] = name;
    data[UserFields.preferences] = preferences;
    return data;
  }
}