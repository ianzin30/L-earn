import 'package:flutter/material.dart';

class LearnAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget child;
  final double pagePosition;
  final int pageIndex;
  final AlignmentGeometry? alignment;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? retunrFunction;

  LearnAppBar({
    required this.child,
    required this.pagePosition,
    required this.pageIndex,
    this.alignment,
    this.padding,
    this.retunrFunction
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
          colors: const [
            Color(0xFF7A7FFF),
            Color(0xFF040862),
          ],
        ),
        borderRadius: isRounded
            ? const BorderRadius.vertical(bottom: Radius.circular(50))
            : BorderRadius.zero,
      ),
      child: SafeArea(
        child:Stack(
          children: [
            if (retunrFunction != null)
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
                  child:
                    Container(
                      height: 40,
                      width: 40,
                      decoration: 
                      BoxDecoration(
                        color: const Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: IconButton(
                        icon:  const Icon(Icons.arrow_back, color: Colors.black),
                        onPressed: retunrFunction,
                        iconSize: 24,
                      )
                    )
                  ),
            Container(
              alignment: alignment,
              padding : padding,
              child: child
            )
        ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(235);
}

class LearnAppBarSuper extends LearnAppBar {
  final Widget superWidget;

  LearnAppBarSuper({
    required Widget child,
    required double pagePosition,
    required int pageIndex,
    required this.superWidget,
  }) : super(
            child: child,
            pagePosition: pagePosition,
            pageIndex: pageIndex,
         );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child:Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 235,
              child:super.build(context)
            ),
            Positioned(
              child: superWidget, 
              top: 150,
              left: 14,
              right: 14,
              ),
          ],
        )
    );
  }
  @override
  Size get preferredSize => Size.fromHeight(300);
  
}
