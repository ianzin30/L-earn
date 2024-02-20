import 'package:flutter/material.dart';

class MascotBar extends StatelessWidget {
  final VoidCallback onBackPress;
  final String title;

  MascotBar({required this.onBackPress, required this.title});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: onBackPress,
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            // Add more Widgets here if needed, or leave an empty Container if nothing is needed
            Container(width: 48), // This is just to balance the row distribution
          ],
        ),
      ),
    );
  }
}
