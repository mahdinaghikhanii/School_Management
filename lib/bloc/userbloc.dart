import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/user.dart';
import '../repository/userrepository.dart';
import 'blocstate.dart';

class UserBloc extends Cubit<BlocState> {
  UserBloc() : super(Initial()) {
    SharedPreferences.getInstance().then((value) {
      String token = value.getString('token') ?? '';
      if (token.isNotEmpty) {
        verifyByToken(token);
      }
    });
  }

  User? _user;

  void authenticate(String mobile, String password, bool remember) async {
    //karbar 1 bar ghabl tar click kard ya alaki click kard ro login ma request samte server nadim
    if (state is Loading) return;

    try {
      emit(Loading());
      _user = await UsersRepository.authenticate(mobile, password);
      if (remember) {
        SharedPreferences perfs = await SharedPreferences.getInstance();
        await perfs.setString('token', _user!.token!);
      }

      emit(Authenticated(_user!));
    } catch (e) {
      emit(Failed(e as Exception));
    }
  }

  void verifyByToken(String token) async {
    if (state is Loading) return;

    try {
      emit(Loading());
      _user = await UsersRepository.userVerifyByToken(token);
      emit(Authenticated(_user!));
    } catch (e) {
      emit(Initial());
    }
  }

  void signOut() async {
    SharedPreferences perfs = await SharedPreferences.getInstance();
    await perfs.remove('token');
    emit(Initial());
  }

  User? get user => _user;
}
