import 'package:flutter/material.dart';

class UserPhotoAndName extends StatelessWidget {
  final String userName;
  final String userPhotoPath;
  final String firstLine;
  final FontWeight fontWeight1;
  final String secondLine;
  final FontWeight fontWeight2;


  const UserPhotoAndName({
    required this.userName,
    required this.userPhotoPath,
    required this.firstLine,
    required this.fontWeight1,
    required this.secondLine,
    required this.fontWeight2,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      // Nesting Rows to keep the image and text together
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Image.asset(userPhotoPath, height: 60),
        ),
        const SizedBox(width: 8), // Adjust the space as needed
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: firstLine,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontFamily: "Fieldwork-Geo",
                  fontWeight: fontWeight1,
                ),
              ),
              TextSpan(
                text: secondLine,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontFamily: "Fieldwork-Geo",
                  fontWeight: fontWeight2,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
