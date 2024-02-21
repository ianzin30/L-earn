import 'package:flutter/material.dart';

class GenericPage extends StatelessWidget {
  final String pageName;

  GenericPage({required this.pageName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pageName),
        elevation: 0, // Customize elevation or remove the shadow
      ),
      body: Center(
        child: Text(
          '$pageName Content',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      // O LearnNavBar será movido para o widget ParentsMain
    );
  }
}
