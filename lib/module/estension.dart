import 'package:flutter/material.dart';
import 'package:schoolmanagement/module/widgets.dart';

extension ContextExtension on BuildContext {
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;
}

extension StringExtesion on String {
  Widget toLabel({double? fontsize, Color? color, bool bold = false}) => Label(
        title: this,
        bold: bold,
        fontSize: fontsize,
        color: color,
      );
}
