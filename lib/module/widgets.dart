import 'package:flutter/material.dart';

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
                  Label(title: title)
                ],
              )
            : Label(title: title));
  }
}

class Label extends StatelessWidget {
  final String title;
  const Label({required this.title, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(title);
  }
}
