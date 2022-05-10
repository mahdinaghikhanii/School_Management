import '../model/user.dart';

class UsersRepository {
  static Future<User> authenticate(String mobile, String password) async {
    return await Future.delayed(const Duration(seconds: 1)).then((value) {
      if (mobile == "2" && password == "1") {
        Map<String, dynamic> _res = {
          "id": 1,
          "name": "mahdi",
          "family": "naghikhani",
          "email": "mahdi@gmail.com",
          "mobile": "0911",
          "type": 1,
          "active": 1,
          "token": "0E984725-C51C-4BF4-9960-E1C80E27ABA0"
        };
        return User.fromJson(_res);
      }
      throw Exception("Mobile/password was wrong");
    });
  }

  static Future<User> userVerifyByToken(String token) async {
    return await Future.delayed(const Duration(seconds: 1)).then((value) {
      if (token == "0E984725-C51C-4BF4-9960-E1C80E27ABA0") {
        Map<String, dynamic> _res = {
          "id": 1,
          "name": "mahdi",
          "family": "naghikhani",
          "email": "mahdi@gmail.com",
          "mobile": "0911",
          "type": 1,
          "active": 1,
          "token": "0E984725-C51C-4BF4-9960-E1C80E27ABA0"
        };
        return User.fromJson(_res);
      }
      throw Exception("Mobile/password was wrong");
    });
  }
}
