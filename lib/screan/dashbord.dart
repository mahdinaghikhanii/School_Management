import 'package:flutter/material.dart';
import 'package:schoolmanagement/module/estension.dart';
import 'package:schoolmanagement/module/widgets.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          "hello ${context.user!.family}".toLabel(),
          MButton(
            type: ButtonType.cancel,
            onTap: () {
              context.userBloc.signOut();
            },
            title: "Sign Out",
          )
        ],
      )).center,
    );
  }
}
