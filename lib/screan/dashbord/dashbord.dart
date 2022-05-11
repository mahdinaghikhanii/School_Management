import 'package:flutter/material.dart';
import 'package:schoolmanagement/module/widgets.dart';

import 'sidbar.dart';
import 'usereinfo.dart';
import 'package:schoolmanagement/module/extension.dart';

MBloc<int> _menu = MBloc<int>()..setValue(1);

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
        stream: _menu.stream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const MWaiting();
          }
          return Scaffold(
              body: SafeArea(
                  child: Row(
            children: [
              SidBar(
                onChanged: (val) => _menu.setValue(val),
                selectIndex: _menu.value,
              ),
              Container(
                color: Colors.blue.shade100,
              ).expanded,
              UserInfo()
            ],
          )));
        });
  }
}
