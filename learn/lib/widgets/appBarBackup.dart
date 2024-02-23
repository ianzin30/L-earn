import 'package:flutter/material.dart';

class LearnAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final Widget? leading;
  final ValueNotifier<bool> isAppBarRounded;

  LearnAppBar({
    required this.title,
    this.actions,
    this.leading,
    required this.isAppBarRounded,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: isAppBarRounded,
      builder: (_, __) => AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: preferredSize.height,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF7A7FFF),
              Color(0xFF040862),
            ],
          ),
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(isAppBarRounded.value ? 50 : 0),
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (leading != null)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    leading!,
                    Expanded(
                      child: Text(
                        title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    ...actions ?? [SizedBox(width: 48)],
                  ],
                ),
              if (leading == null)
                Center(
                  child: Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(200);
}
