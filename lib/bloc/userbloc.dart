import 'package:flutter_bloc/flutter_bloc.dart';
import '../model/user.dart';
import '../repository/userrepository.dart';
import 'blocstate.dart';

class UserBloc extends Cubit<BlocState> {
  UserBloc() : super(Initial());

  User? _user;

  void authenticate(String mobile, String password) async {
    //karbar 1 bar ghabl tar click kard ya alaki click kard ro login ma request samte server nadim
    if (state is Loading) return;
    emit(Loading());
    try {
      _user = await UsersRepository.authenticate(mobile, password);
      emit(Authenticated(_user!));
    } catch (e) {
      emit(Failed(e as Exception));
    }
  }

  void signOut() => emit(Initial());

  User? get user => _user;
}
