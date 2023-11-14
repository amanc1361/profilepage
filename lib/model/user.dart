import 'package:task1/api/baseapi.dart';
import 'package:get_storage/get_storage.dart';

class User {
  static final User _singleton = User._internal();
  factory User() => _singleton;
  User._internal();
  static User get shared => _singleton;
  String? token;
  String? id;

  Future checkin(String cellPhone) async {
    return await BaseApi()
        .post(baseUrl: BaseApi().basuUrl, pathUrl: "checkin", body: {"cellphone": cellPhone.toString()}).then((value) {
      id = value["checkIn"]["id"];
      final box = GetStorage();
      box.write("id", id);
    }).catchError((onError) {
      throw onError;
    });
  }

  Future login(String id, String code) async {
    return await BaseApi()
        .get(baseUrl: BaseApi().basuUrl, pathUrl: "verify", body: {"id": id, "code": code}).then((value) {
      token = value["verifyCode"]["token"];

      final box = GetStorage();
      box.write("token", token);
      return;
    }).catchError((onError) {
      throw onError;
    });
  }
}
