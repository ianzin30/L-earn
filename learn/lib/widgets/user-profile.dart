import 'package:flutter/material.dart';

class UserPhotoAndName extends StatelessWidget {
  final String userName;
  final String userPhotoPath;

  const UserPhotoAndName({
    required this.userName,
    required this.userPhotoPath,
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
              const TextSpan(
                text: 'Seja bem-vindo,\n',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontFamily: "Fieldwork-Geo",
                  fontWeight: FontWeight.normal,
                ),
              ),
              TextSpan(
                text: userName,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontFamily: "Fieldwork-Geo",
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
