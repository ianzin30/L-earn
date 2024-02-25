import 'package:flutter/material.dart';

class StreakWidget extends StatelessWidget {
  final int streakDays;

  const StreakWidget({
    Key? key,
    required this.streakDays,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF5E5CE6), // The background color of the container
        borderRadius: BorderRadius.circular(20), // Rounded corners
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min, // To fit the content
        children: [
          Image.asset(
            'assets/images/appIcons/Vector.png', // Use the custom image
            color: Colors.white, // Apply a color filter if needed // Set your desired width
            height: 24, // Set your desired height
          ),
          const SizedBox(width: 8), // Spacing between icon and text
          Text(
            'Streak de $streakDays dias', // The streak text
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}

