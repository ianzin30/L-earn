import 'package:flutter/material.dart';

class MascotPopUp extends StatelessWidget {
  final VoidCallback onStartPressed;

  MascotPopUp({required this.onStartPressed});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Iniciar Atividade',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Prepare-se para começar uma nova aventura!',
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: onStartPressed,
              child: Text('Iniciar'),
            ),
          ],
        ),
      ),
    );
  }
}
