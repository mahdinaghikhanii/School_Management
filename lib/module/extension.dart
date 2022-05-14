import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../bloc/themebloc.dart';
import '../bloc/userbloc.dart';
import '../model/user.dart';
import 'widgets.dart';

extension ContextExtension on BuildContext {
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;

  double widthResponse(double min, double max, double perc) =>
      MediaQuery.of(this).size.width * perc < min
          ? min
          : MediaQuery.of(this).size.width * perc > max
              ? max
              : MediaQuery.of(this).size.width * perc;
  //Navigation next page or Screans
  void showForm(Widget child) =>
      Navigator.push(this, MaterialPageRoute(builder: (context) => child));

  //SignOut

  //  this part for read UserBloc and easy code and clean
  UserBloc get userBloc => read<UserBloc>();
  User? get user => read<UserBloc>().user;
  bool get isDark => Theme.of(this).brightness == Brightness.dark;
  ThemeBloc get themeBloc => read<ThemeBloc>();
  Color get bottomAppBarColor => Theme.of(this).bottomAppBarColor;
  Color get accentColor => Theme.of(this).colorScheme.secondary;
}

extension StringExtesion on String {
  Widget toLabel({double? fontsize, Color? color, bool bold = false}) => MLabel(
        title: replaceAll("Exception: ", ''),
        bold: bold,
        fontSize: fontsize,
        color: color,
      );
}

extension WidgetExtesion on Widget {
  //extesion margin
  Widget get vMargin3 =>
      Container(margin: const EdgeInsets.symmetric(vertical: 3), child: this);
  Widget get vMargin6 =>
      Container(margin: const EdgeInsets.symmetric(vertical: 6), child: this);
  Widget get vMargin9 =>
      Container(margin: const EdgeInsets.symmetric(vertical: 9), child: this);
  Widget get hMargin3 =>
      Container(margin: const EdgeInsets.symmetric(horizontal: 3), child: this);
  Widget get hMargin6 =>
      Container(margin: const EdgeInsets.symmetric(horizontal: 6), child: this);
  Widget get hMargin9 =>
      Container(margin: const EdgeInsets.symmetric(horizontal: 9), child: this);
  Widget get margin3 => Container(margin: const EdgeInsets.all(3), child: this);
  Widget get margin6 => Container(margin: const EdgeInsets.all(6), child: this);
  Widget get margin9 => Container(margin: const EdgeInsets.all(9), child: this);

  //extesion padding
  Widget get vPadding3 =>
      Container(padding: const EdgeInsets.symmetric(vertical: 3), child: this);
  Widget get vPadding6 =>
      Container(padding: const EdgeInsets.symmetric(vertical: 6), child: this);
  Widget get vPadding9 =>
      Container(padding: const EdgeInsets.symmetric(vertical: 9), child: this);
  Widget get hPadding3 => Container(
      padding: const EdgeInsets.symmetric(horizontal: 3), child: this);
  Widget get hPadding6 => Container(
      padding: const EdgeInsets.symmetric(horizontal: 6), child: this);
  Widget get hPadding9 => Container(
      padding: const EdgeInsets.symmetric(horizontal: 9), child: this);
  Widget get padding3 =>
      Container(padding: const EdgeInsets.all(3), child: this);
  Widget get padding6 =>
      Container(padding: const EdgeInsets.all(6), child: this);
  Widget get padding9 =>
      Container(padding: const EdgeInsets.all(9), child: this);

  Widget get card => Card(child: this);
  Widget get expanded => Expanded(child: this);
  Widget get center => Center(child: this);
}
