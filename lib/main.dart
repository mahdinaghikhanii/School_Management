import 'package:flutter/material.dart';
import 'package:schoolmanagement/module/widgets.dart';
import 'package:schoolmanagement/screan/dashbord.dart';
import 'module/estension.dart';

void main() {
  runApp(const MyApp());
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
        home: const HomeViews());
  }
}

class HomeViews extends StatelessWidget {
  const HomeViews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              hint: "Username",
              autoFocus: false,
              password: true,
              onChange: (val) => print(val)).padding9,
          Edit(
              hint: "Password",
              autoFocus: false,
              password: true,
              onChange: (val) => print(val)).padding9,
          Row(mainAxisSize: MainAxisSize.min, children: [
            Button(
              color: Colors.green,
              title: "Register",
              icon: const Icon(Icons.edit),
              onTap: () {},
              padding: const EdgeInsets.all(22),
            ).margin9,
            Button(
              color: Colors.blue,
              title: "Login",
              onTap: () {
                context.showForm(const Dashboard());
              },
              icon: const Icon(Icons.vpn_key),
              padding: const EdgeInsets.all(22),
            ).margin9,
          ]),
        ],
      ),
    ).padding9.card.center));
  }
}
