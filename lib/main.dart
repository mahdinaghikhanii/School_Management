import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/blocstate.dart';
import 'bloc/userbloc.dart';
import 'module/estension.dart';
import 'module/widgets.dart';
import 'screan/dashbord.dart';

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

class Login extends StatelessWidget {
  final BlocState state;
  const Login({required this.state, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _mobile = TextEditingController();
    TextEditingController _password = TextEditingController();

    return Scaffold(
        //   appBar: AppBar(),
        body: SafeArea(
            child: SizedBox(
      width: context.width * 0.3 < 260 ? 350 : context.width * 0.3,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          "Welcome To School Test"
              .toLabel(bold: true, fontsize: 22, color: Colors.grey)
              .vMargin9,
          Edit(
              controller: _mobile,
              hint: "Username",
              autoFocus: false,
              password: true,
              onChange: (val) => print(val)).padding9,
          Edit(
              controller: _password,
              hint: "Password",
              autoFocus: false,
              password: true,
              onChange: (val) => print(val)).padding9,
          Row(mainAxisSize: MainAxisSize.min, children: [
            AbsorbPointer(
              absorbing: state is Loading ? true : false,
              child: Button(
                color: Colors.green,
                title: "Register",
                icon: const Icon(Icons.edit, size: 15),
                onTap: () {
                  print('fuck');
                },
              ).margin9,
            ),
            state is Loading ? const CupertinoActivityIndicator() : Container(),
            Button(
              color: Colors.blue,
              title: "Login",
              onTap: () {
                context
                    .read<UserBloc>()
                    .authenticate(_mobile.text, _password.text);
              },
              icon: const Icon(
                Icons.vpn_key,
                size: 15,
              ),
            ).margin9,
          ]),
          state is Failed
              ? Container(
                  margin: const EdgeInsets.symmetric(horizontal: 25),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(12)),
                  child: (state as Failed)
                      .exception
                      .toString()
                      .toLabel(color: Colors.white, bold: true))
              : Container()
        ],
      ),
    ).padding9.card.center));
  }
}
