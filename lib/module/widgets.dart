import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

import 'estension.dart';

enum ButtonType { save, news, delete, cancel, other }

class MBloc<T> {
  final BehaviorSubject<T> _bloc = BehaviorSubject<T>();
  Stream<T> get stream => _bloc.stream;
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
    return hint != null
        ? Tooltip(
            message: hint,
            child: Switch(value: value, onChanged: onChanged),
          )
        : Switch(value: value, onChanged: onChanged);
  }
}
