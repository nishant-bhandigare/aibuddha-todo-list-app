import 'package:flutter/material.dart';

import '../constants/colours.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final IconData? leftIcon;
  final String title;
  final IconData? rightIcon;
  final VoidCallback onLeftIconPressed;
  final VoidCallback onRightIconPressed;

  const CustomAppBar({
    super.key,
    required this.leftIcon,
    required this.title,
    required this.rightIcon,
    required this.onLeftIconPressed,
    required this.onRightIconPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      toolbarHeight: 80,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(40),
          bottomLeft: Radius.circular(40),
        ),
      ),
      leading: leftIcon != null
          ? IconButton(
              icon: Icon(leftIcon, color: Colors.black),
              onPressed: onLeftIconPressed as void Function()?,
            )
          : const SizedBox(width: 0),
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      actions: [
        rightIcon != null
            ? IconButton(
                icon: Icon(rightIcon, color: Colors.black),
                onPressed: onRightIconPressed as void Function()?,
              )
            : const SizedBox(width: 0),
      ],
      backgroundColor: widgetColour,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80.0);
}
