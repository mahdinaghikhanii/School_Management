import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../module/theme.dart';
import 'blocstate.dart';

class ThemeBloc extends Cubit<ThemeState> {
  ThemeBloc() : super(ThemeState(AppTheme.light)) {
    loadTheme();
  }

  void loadTheme() async {
    SharedPreferences _prfs = await SharedPreferences.getInstance();
    String _str = _prfs.getString('theme') ?? '';

    if (_str == 'dark') emit(ThemeState(AppTheme.dark));
  }

  void setTheme(AppTheme theme) async {
    emit(ThemeState(theme));

    await SharedPreferences.getInstance().then((value) =>
        value.setString('theme', theme == AppTheme.dark ? 'dark' : 'light'));
  }
}
