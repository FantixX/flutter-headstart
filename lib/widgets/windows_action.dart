import 'package:flutter/material.dart';

class WindowsAction extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final Color? hoverColor;
  final Color? color;
  const WindowsAction(
      {super.key,
      required this.icon,
      required this.onPressed,
      this.hoverColor,
      this.color});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: IconButton(
          splashRadius: 100,
          padding: EdgeInsets.zero,
          hoverColor: hoverColor,
          onPressed: onPressed,
          icon: Icon(
            icon,
            color: color,
            size: 20,
          )),
    );
  }
}
