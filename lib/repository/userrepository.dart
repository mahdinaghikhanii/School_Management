import '../model/user.dart';

Future<User> authenticate(String mobile, String password) async {
  return await Future.delayed(const Duration(seconds: 3)).then((value) {
    if (mobile == "2" && password == "1") {
      Map<String, dynamic> _res = {};
      return User.fromJson(_res);
    }
    throw Exception("Mobile/password was wrong");
  });
}
