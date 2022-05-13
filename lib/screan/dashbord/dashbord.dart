import 'package:flutter/material.dart';

import '../../module/extension.dart';
import '../../module/widgets.dart';
import 'sidbar.dart';
import 'usereinfo.dart';

MBloc<int> _menu = MBloc<int>()..setValue(1);
MBloc<int> _dashbordmenu = MBloc<int>()..setValue(1);
//MBloc<int> _dashhover = MBloc<int>()..setValue(1);

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
    return StreamBuilder<int>(
        stream: _dashbordmenu.stream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const MWaiting();
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                      width: 300,
                      child: MEdit(
                        hint: "Search...",
                        autoFocus: false,
                        password: false,
                      )).padding9,
                  const MDarkLightSwitch(),
                ],
              ),
              const SizedBox(
                height: 35,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () => _dashbordmenu.setValue(1),
                    child: Container(
                        width: 100,
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                                color: (snapshot.data ?? 0) == 1
                                    ? Colors.green
                                    : Colors.grey,
                                width: 1),
                          ),
                        ),
                        padding: const EdgeInsets.only(bottom: 15),
                        child: "Student"
                            .toLabel(
                              color: (snapshot.data ?? 0) == 1
                                  ? Colors.green
                                  : Colors.grey,
                            )
                            .center),
                  ),
                  GestureDetector(
                    onTap: () => _dashbordmenu.setValue(2),
                    child: Container(
                        width: 100,
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                                color: (snapshot.data ?? 0) == 2
                                    ? Colors.green
                                    : Colors.grey,
                                width: 1),
                          ),
                        ),
                        padding: const EdgeInsets.only(bottom: 15),
                        child: "Student"
                            .toLabel(
                              color: (snapshot.data ?? 0) == 2
                                  ? Colors.green
                                  : Colors.grey,
                            )
                            .center),
                  ),
                  GestureDetector(
                    onTap: () => _dashbordmenu.setValue(3),
                    child: Container(
                        width: 100,
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                                color: (snapshot.data ?? 0) == 3
                                    ? Colors.green
                                    : Colors.grey,
                                width: 1),
                          ),
                        ),
                        padding: const EdgeInsets.only(bottom: 15),
                        child: "Class".toLabel(
                          color: (snapshot.data ?? 0) == 3
                              ? Colors.green
                              : Colors.grey,
                        )).center,
                  ),
                  Container(
                      width: 100,
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Colors.grey, width: 1),
                        ),
                      ),
                      padding: const EdgeInsets.only(bottom: 15),
                      child: "".toLabel(
                        color: Colors.grey,
                      )).expanded,
                ],
              )
            ],
          ).padding9.margin9;
        });
  }
}
