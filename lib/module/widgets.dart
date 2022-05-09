import 'package:flutter/material.dart';

import 'estension.dart';

enum ButtonType { save, news, delete, cancel, other }

class Button extends StatelessWidget {
  final String? title;
  final VoidCallback onTap;
  final Icon? icon;
  final Color? color;
  final ButtonType? type;
  final EdgeInsets? padding;

  const Button(
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

class Label extends StatelessWidget {
  final String title;
  final double? fontSize;
  final Color? color;
  final bool bold;
  const Label(
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

class Edit extends StatelessWidget {
  final String hint;
  final Function(String)? onChange;
  final bool autoFocus;
  final bool notempty;
  final TextEditingController? controller;
  final bool password;

  const Edit(
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
