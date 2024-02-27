import 'package:flutter/material.dart';

class LearnAppBar extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget> children;
  final double pagePosition;
  final int pageIndex;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final VoidCallback? retunrFunction;

  LearnAppBar({
    required this.children,
    required this.pagePosition,
    required this.pageIndex,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
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
            Column(
              mainAxisAlignment: mainAxisAlignment,
              crossAxisAlignment: crossAxisAlignment,
              children: children,
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
    required List<Widget> children,
    required double pagePosition,
    required int pageIndex,
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,

    required this.superWidget,
  }) : super(
            children: children,
            pagePosition: pagePosition,
            pageIndex: pageIndex,
            mainAxisAlignment: mainAxisAlignment,
            crossAxisAlignment: crossAxisAlignment,
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