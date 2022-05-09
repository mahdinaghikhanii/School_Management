import '../model/user.dart';

class UsersRepository {
  static Future<User> authenticate(String mobile, String password) async {
    return await Future.delayed(const Duration(seconds: 3)).then((value) {
      if (mobile == "2" && password == "1") {
        Map<String, dynamic> _res = {
          "id": 1,
          "name": "mahdi",
          "family": "naghikhani",
          "email": "mahdi@gmail.com",
          "mobile": "0911",
          "type": 1,
          "active": 1
        };
        return User.fromJson(_res);
      }
      throw Exception("Mobile/password was wrong");
    });
  }
}
