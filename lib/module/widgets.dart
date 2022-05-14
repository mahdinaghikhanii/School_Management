import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rxdart/rxdart.dart';

import 'extension.dart';
import 'theme.dart';

enum ButtonType { save, news, delete, cancel, other }

class MBloc<t> {
  final BehaviorSubject<t> _bloc = BehaviorSubject<t>();
  Stream<t> get stream => _bloc.stream;
  t get value => _bloc.value;
  void setValue(t val) => _bloc.add(val);
}

class MButton extends StatelessWidget {
  final String? title;
  final VoidCallback onTap;
  final Icon? icon;
  final Color? color;
  final ButtonType? type;
  final EdgeInsets? padding;

  const MButton(
      {this.title,
      required this.onTap,
      this.type,
      this.color,
      this.icon,
      this.padding,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            // ignore: prefer_if_null_operators
            backgroundColor: MaterialStateProperty.all(color != null
                ? color
                : type == ButtonType.save
                    ? Colors.green
                    : type == ButtonType.cancel
                        ? Colors.deepOrangeAccent
                        : type == ButtonType.delete
                            ? Colors.redAccent
                            : type == ButtonType.news
                                ? Colors.blue
                                : Colors.transparent),
            padding:
                MaterialStateProperty.all(padding ?? const EdgeInsets.all(22))),
        onPressed: onTap,
        child: type != null
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  icon ??
                      Icon(
                        type == ButtonType.save
                            ? Icons.save
                            : type == ButtonType.cancel
                                ? Icons.cancel
                                : type == ButtonType.delete
                                    ? Icons.delete
                                    : type == ButtonType.news
                                        ? Icons.new_label
                                        : Icons.help_center,
                      ),
                  const SizedBox(
                    width: 5,
                  ),
                  title != null
                      ? '$title'.toLabel()
                      : type == ButtonType.save
                          ? 'save'.toLabel()
                          : type == ButtonType.cancel
                              ? "Cancel".toLabel()
                              : type == ButtonType.delete
                                  ? "Delete".toLabel()
                                  : type == ButtonType.news
                                      ? "New".toLabel()
                                      : '$title'.toLabel()
                ],
              )
            : icon != null
                ? Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      icon!,
                      const SizedBox(
                        width: 5,
                      ),
                      '$title'.toLabel()
                    ],
                  )
                : '$title'.toLabel());
  }
}

class MLabel extends StatelessWidget {
  final String title;
  final double? fontSize;
  final Color? color;
  final bool bold;
  const MLabel(
      {required this.title,
      required this.bold,
      this.color,
      this.fontSize,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(title,
        style: TextStyle(
            fontSize: fontSize,
            color: color,
            fontWeight: bold ? FontWeight.bold : FontWeight.normal));
  }
}

class MEdit extends StatelessWidget {
  final String hint;
  final Function(String)? onChange;
  final bool autoFocus;
  final bool notempty;

  final TextEditingController? controller;
  final bool password;

  const MEdit(
      {required this.hint,
      required this.autoFocus,
      required this.password,
      this.notempty = false,
      this.controller,
      this.onChange,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        onChanged: onChange,
        validator: (val) {
          if ((val ?? '').isEmpty && notempty) {
            return "cannot be empty";
          }
          return null;
        },
        decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8), gapPadding: 20),
            labelText: hint,
            labelStyle: TextStyle(color: Colors.grey.shade400, fontSize: 16)),
        obscureText: password);
  }
}

class MTextButton extends StatelessWidget {
  final String title;
  final Color? color;
  final VoidCallback ontap;
  const MTextButton(
      {required this.ontap, required this.title, this.color, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: () {}, child: title.toLabel(color: color));
  }
}

class MSwitch extends StatelessWidget {
  final bool value;
  final Function(bool) onChanged;
  final String? hint;
  const MSwitch(
      {required this.value, required this.onChanged, this.hint, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    MBloc<bool> _value = MBloc<bool>()..setValue(value);
    return StreamBuilder<bool>(
        stream: _value.stream,
        builder: (_, snap) {
          if (snap.hasData) {
            return hint != null
                ? Tooltip(
                    message: hint!,
                    child: Switch(
                        value: snap.data!,
                        onChanged: (val) {
                          onChanged(val);
                          _value.setValue(val);
                        }),
                  )
                : Switch(
                    value: snap.data!,
                    onChanged: (val) {
                      onChanged(val);
                      _value.setValue(val);
                    });
          }
          return Container();
        });
  }
}

class MError extends StatelessWidget {
  final Exception exception;
  const MError({required this.exception, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 25),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: Colors.red, borderRadius: BorderRadius.circular(12)),
        child: exception.toString().toLabel(color: Colors.white, bold: true));
  }
}

class MWaiting extends StatelessWidget {
  const MWaiting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CupertinoActivityIndicator().center;
  }
}

class MSideBarItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final int value;
  final bool selected;
  final VoidCallback onPreassed;
  const MSideBarItem(
      {required this.icon,
      required this.onPreassed,
      this.selected = false,
      this.value = 0,
      required this.title,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      selectedTileColor: context.bottomAppBarColor,
      selected: selected,
      title: title.toLabel(color: Colors.grey.shade500, fontsize: 13),
      leading: Icon(
        icon,
        size: 15,
        color: Colors.grey.shade500,
      ),
      trailing: value > 0
          ? CircleAvatar(
              backgroundColor: Colors.pink,
              radius: 10,
              child: '$value'.toLabel(fontsize: 10),
            )
          : null,
      onTap: onPreassed,
    );
  }
}

class MDarkLightSwitch extends StatelessWidget {
  const MDarkLightSwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.themeBloc
          .setTheme(context.isDark ? AppTheme.light : AppTheme.dark),
      child: SizedBox(
        width: 40,
        height: 25,
        child: Stack(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 7),
              height: 10,
              width: 35,
              decoration: BoxDecoration(
                  color: context.accentColor.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(20)),
            ),
            context.isDark
                ? Container()
                : Align(
                    alignment: Alignment.centerRight,
                    child: FaIcon(
                      FontAwesomeIcons.sun,
                      color: Colors.yellow.shade700,
                    ),
                  ),
            context.isDark
                ? Align(
                    alignment: Alignment.centerLeft,
                    child: FaIcon(
                      FontAwesomeIcons.moon,
                      color: Colors.blue.shade600,
                    ),
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
