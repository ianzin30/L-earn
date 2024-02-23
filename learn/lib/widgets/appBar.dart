import 'package:flutter/material.dart';

class LearnAppBar extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget> children;
  final double pagePosition;
  final int pageIndex;

  LearnAppBar({
    required this.children,
    required this.pagePosition,
    required this.pageIndex
  });

  @override
  Widget build(BuildContext context) {
    bool isRounded = pagePosition == pagePosition.floorToDouble();
    double pageOffset = pagePosition - pageIndex;
    Alignment gradientStart = Alignment(-pageOffset, -1.0);
    Alignment gradientEnd = Alignment(pageOffset, 1.0);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: preferredSize.height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: gradientStart,
          end: gradientEnd,
          colors: [
            Color(0xFF7A7FFF),
            Color(0xFF040862),
          ],
        ),
        borderRadius: isRounded
            ? BorderRadius.vertical(bottom: Radius.circular(50))
            : BorderRadius.zero,
      ),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: children,
        ),
      ),
    );
  }


  @override
  Size get preferredSize => Size.fromHeight(200);
}
