import 'package:flutter/material.dart';
import 'estension.dart';

class Button extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final Icon? icon;
  final Color? color;
  final EdgeInsets? padding;

  const Button(
      {required this.title,
      required this.onTap,
      this.color,
      this.icon,
      this.padding,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(color),
            padding: MaterialStateProperty.all(padding)),
        onPressed: onTap,
        child: icon != null
            ? Row(
                children: [
                  icon!,
                  const SizedBox(
                    width: 5,
                  ),
                  title.toLabel()
                ],
              )
            : Label(
                title: title,
                bold: false,
              ));
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
