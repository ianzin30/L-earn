import 'package:flutter/material.dart';

class UserProfileWidget extends StatelessWidget {
  final String name;
  final int age;
  final int level;
  final int completedTrails;
  final String userPhotoPath;

  const UserProfileWidget({
    required this.name,
    required this.userPhotoPath,
    required this.age,
    required this.level,
    required this.completedTrails,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 14),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3.0),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(userPhotoPath, height: 48),
                ),
                const SizedBox(width: 16.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name,
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold)),
                    Text('$age anos', style: const TextStyle(fontSize: 10)),
                  ],
                ),
                const SizedBox(width: 16.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Nível $level',
                        style: const TextStyle(
                            fontSize: 10, fontWeight: FontWeight.w600)),
                    Text('$completedTrails trilhas concluídas',
                        style: const TextStyle(fontSize: 10)),
                  ],
                ),
                const Spacer(),
                Image.asset('assets/images/appIcons/silver-badge.png',
                    height: 48),
              ],
            ),
          ),
        );
      },
    );
  }
}
