import 'package:flutter/material.dart';

class MascotBar extends StatelessWidget implements PreferredSizeWidget {
  final PageController pageController;

  MascotBar({required this.pageController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: AppBar(
        leading: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  color: const Color(0xff101573),
                  borderRadius: BorderRadius.circular(10)),
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                iconSize: 18,
                onPressed: () {
                  pageController.animateToPage(
                    0,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.ease,
                  );
                },
              ),
            ),
          ],
        ),
        title: const Text('Mascote',
            style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontFamily: 'Fieldwork-Geo',
                fontWeight: FontWeight.w400)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
    );
  }

  @override
  Size get preferredSize =>
      const Size.fromHeight(kToolbarHeight); // Provide the preferred size here
}