import 'package:flutter/material.dart';

import '../../module/extension.dart';
import '../../module/widgets.dart';

class SidBar extends StatelessWidget {
  final Function(int) onChanged;
  final int selectIndex;
  const SidBar({required this.onChanged, required this.selectIndex, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              selected: selectIndex == 1,
              title: "Dashbord",
              icon: Icons.dashboard,
              onPreassed: () => onChanged(1)),
          MSideBarItem(
              title: "Messages",
              value: 2,
              selected: selectIndex == 2,
              icon: Icons.message,
              onPreassed: () => onChanged(1)),
          MSideBarItem(
              title: "Students",
              selected: selectIndex == 3,
              icon: Icons.people,
              onPreassed: () => onChanged(3)),
          MSideBarItem(
              title: "Classes",
              icon: Icons.class_,
              selected: selectIndex == 4,
              onPreassed: () => onChanged(4)),
          const SizedBox(
            height: 50,
          ),
          MSideBarItem(
              title: "Settings",
              selected: selectIndex == 5,
              icon: Icons.settings,
              onPreassed: () => onChanged(5)),
        ],
      ),
    );
    ;
  }
}
