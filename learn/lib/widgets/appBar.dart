import 'package:flutter/material.dart';

class LearnAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final Widget? leading;
  final PreferredSizeWidget? bottom;
  final Color? backgroundColor;
  final bool centerTitle;

  LearnAppBar({
    required this.title,
    this.actions,
    this.leading,
    this.bottom,
    this.backgroundColor,
    this.centerTitle = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      leading: leading,
      actions: actions,
      bottom: bottom,
      backgroundColor: backgroundColor ?? Theme.of(context).primaryColor,
      centerTitle: centerTitle,
      elevation: 0, // Customize elevation or remove the shadow
    );
  }

  @override
  Size get preferredSize => bottom?.preferredSize ?? Size.fromHeight(kToolbarHeight);
}
