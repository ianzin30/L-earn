import 'package:flutter/material.dart';

class MascotBar extends StatelessWidget implements PreferredSizeWidget {
  final PageController pageController;
  
  MascotBar({required this.pageController});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xff101573),
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              pageController.animateToPage(
                0,
                duration: const Duration(milliseconds: 500),
                curve: Curves.ease,
              );
            },
          ),
        ),
      ),
      title: const Text('Mascote', style: TextStyle(color: Colors.black, fontSize: 18)),
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight); // Provide the preferred size here
}
