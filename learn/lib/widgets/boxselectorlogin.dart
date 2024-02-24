import 'package:flutter/material.dart';

class CustomRadioTile extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const CustomRadioTile({
    Key? key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color:
              isSelected ? const Color.fromARGB(255, 255, 255, 255) : Colors.white, // Highlight color
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: isSelected ? Color(0xFF040862) : Colors.grey, // Highlight color
            width: 0.75,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 3,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(child: Text(title, style: TextStyle(fontSize: 16))),
            if (isSelected)
              Icon(Icons.check_circle,
                  color: Color.fromARGB(255, 44, 52, 199)), // Selected state icon
            if (!isSelected)
              Icon(Icons.radio_button_unchecked,
                  color: Colors.grey), // Unselected state icon
          ],
        ),
      ),
    );
  }
}
