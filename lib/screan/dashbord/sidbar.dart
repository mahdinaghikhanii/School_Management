import 'package:flutter/material.dart';

import '../../module/extension.dart';

class SidBar extends StatelessWidget {
  const SidBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width * 0.2 > 250 ? 250 : context.width * 0.2,
      child: Column(
        children: [
          const SizedBox(
            height: 35,
          ),
          'Schole'.toLabel(fontsize: 18, color: Colors.grey.shade600),
          const SizedBox(
            height: 70,
          ),
          ListTile(
            onTap: () {},
            hoverColor: Colors.blueAccent,
            title: 'Dasbord'.toLabel(
              color: Colors.grey.shade500,
            ),
            leading: Icon(
              Icons.dashboard,
              size: 18,
              color: Colors.grey.shade500,
            ),
          )
        ],
      ),
    );
  }
}
