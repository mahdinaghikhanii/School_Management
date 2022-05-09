import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/blocstate.dart';
import 'bloc/userbloc.dart';
import 'screan/dashbord.dart';
import 'screan/login.dart';

void main() {
  runApp(MultiBlocProvider(
      providers: [BlocProvider<UserBloc>(create: (_) => UserBloc())],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocBuilder<UserBloc, BlocState>(builder: (context, state) {
        if (state is Authenticated) return const Dashboard();
        return Login(
          state: state,
        );
      }),
    );
  }
}
