import 'package:flutter/material.dart';

class LoginEnterButton extends StatelessWidget {
  final Function onPressed;
  final String title;
  final List<Color> colors;

  LoginEnterButton({
    required this.onPressed,
    required this.title,
    required this.colors
  });

  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 210,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: LinearGradient(
          colors: colors,
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(0, 3)),
        ],
      ),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors
                .transparent, // Background color (transparent)
            foregroundColor:
                Colors.transparent, // Splash color (transparent)
            shadowColor:
                Colors.transparent, // Shadow color (transparent)
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            elevation: 0, // No elevation
          ),
          onPressed: () {onPressed();},
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.white,
              fontFamily: "Fieldwork-Geo"
            ),
          ))
    );
  }
}
