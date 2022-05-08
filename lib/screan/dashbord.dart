import 'package:flutter/material.dart';
import 'package:schoolmanagement/module/estension.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: ["Dashbord".toLabel()],
      )),
    );
  }
}
