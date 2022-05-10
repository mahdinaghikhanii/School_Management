import 'package:flutter/material.dart';

import 'sidbar.dart';
import 'usereinfo.dart';
import 'package:schoolmanagement/module/extension.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Row(
      children: [
        SidBar(),
        Container(
          color: Colors.blue.shade100,
        ).expanded,
        UserInfo()
      ],
    )));
  }
}
