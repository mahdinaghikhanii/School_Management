import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_strategy/url_strategy.dart';

import 'bloc/blocstate.dart';
import 'bloc/themebloc.dart';
import 'bloc/userbloc.dart';
import 'module/theme.dart';
import 'screan/dashbord/dashbord.dart';
import 'screan/login.dart';

void main() {
  setPathUrlStrategy();
  runApp(MultiBlocProvider(providers: [
    BlocProvider<UserBloc>(create: (_) => UserBloc()),
    BlocProvider<ThemeBloc>(create: (_) => ThemeBloc())
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, BlocState>(
      builder: (_, state) => MaterialApp(
        title: 'SchoolManagment',
        debugShowCheckedModeBanner: false,
        theme: appThemeData[state is ThemeState ? state.theme : AppTheme.light],
        home: BlocBuilder<UserBloc, BlocState>(builder: (context, state) {
          if (state is Authenticated) return const Dashboard();
          return Login(
            state: state,
          );
        }),
      ),
    );
  }
}
