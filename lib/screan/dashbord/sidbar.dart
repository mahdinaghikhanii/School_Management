import 'package:flutter/material.dart';

import '../../module/extension.dart';
import '../../module/widgets.dart';

class SidBar extends StatelessWidget {
  const SidBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MBloc<int> _selindex = MBloc<int>()..setValue(1);
    return StreamBuilder<int>(
        stream: _selindex.stream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Container();
          }
          return SizedBox(
            width: context.widthResponse(0.23, 180, 250),
            child: Column(
              children: [
                const SizedBox(
                  height: 35,
                ),
                'Schole'.toLabel(fontsize: 18, color: Colors.grey.shade600),
                const SizedBox(
                  height: 70,
                ),
                MSideBarItem(
                    selected: snapshot.data == 1,
                    title: "Dashbord",
                    icon: Icons.dashboard,
                    onPreassed: () => _selindex.setValue(1)),
                MSideBarItem(
                    title: "Messages",
                    value: 3,
                    selected: snapshot.data == 2,
                    icon: Icons.message,
                    onPreassed: () => _selindex.setValue(2)),
                MSideBarItem(
                    title: "Students",
                    selected: snapshot.data == 3,
                    icon: Icons.people,
                    onPreassed: () => _selindex.setValue(3)),
                MSideBarItem(
                    title: "Classes",
                    icon: Icons.class_,
                    selected: snapshot.data == 4,
                    onPreassed: () => _selindex.setValue(4)),
                const SizedBox(
                  height: 50,
                ),
                MSideBarItem(
                    title: "Settings",
                    selected: snapshot.data == 5,
                    icon: Icons.settings,
                    onPreassed: () => _selindex.setValue(5))
              ],
            ),
          );
        });
  }
}
