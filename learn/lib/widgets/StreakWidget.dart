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
        gradient: const LinearGradient(colors: [
          Color.fromRGBO(84, 88, 177, 1.0),
          Color.fromRGBO(49, 53, 142, 1.0)
        ], begin: Alignment.centerLeft, end: Alignment.centerRight),
        borderRadius: BorderRadius.circular(6.63),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min, // To fit the content
        children: [
          Image.asset(
            'assets/images/appIcons/icon-steak.png', // Use the custom image
            color: Colors
                .white, // Apply a color filter if needed // Set your desired width
            height: 24, // Set your desired height
          ),
          const SizedBox(width: 8), // Spacing between icon and text
          RichText(
            text: TextSpan(
              children: [
                const TextSpan(
                  text: 'Streak de ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontFamily: "Fieldwork-Geo",
                    fontWeight: FontWeight.normal,
                  ),
                ),
                TextSpan(
                  text: "$streakDays dias",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontFamily: "Fieldwork-Geo",
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
