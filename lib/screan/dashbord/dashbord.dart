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
                child: snapshot.data == 1
                    ? const DashboardContent()
                    : "Other".toLabel().center,
              ).expanded,
              const UserInfo(),
            ],
          )));
        });
  }
}

class DashboardContent extends StatelessWidget {
  const DashboardContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
            width: 300,
            child: MEdit(
              hint: "Search...",
              autoFocus: false,
              password: false,
            )).padding9,
        const SizedBox(
          height: 35,
        ),
        Row(
          children: [
            Container(
                width: 100,
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.green, width: 1),
                  ),
                ),
                padding: const EdgeInsets.only(bottom: 15),
                child: "Student".toLabel(color: Colors.green).center),
            Container(
                width: 100,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.grey.shade200, width: 1),
                  ),
                ),
                padding: const EdgeInsets.only(bottom: 15),
                child: "Student".toLabel(color: Colors.grey).center),
            Container(
                    width: 100,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom:
                            BorderSide(color: Colors.grey.shade200, width: 1),
                      ),
                    ),
                    padding: const EdgeInsets.only(bottom: 15),
                    child: "Class".toLabel(color: Colors.grey))
                .expanded,
          ],
        )
      ],
    ).padding9.margin9;
  }
}
