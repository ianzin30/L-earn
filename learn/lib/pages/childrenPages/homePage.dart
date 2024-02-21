import 'package:flutter/material.dart';
import '/widgets/appBar.dart';

class ChildrenHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LearnAppBar(
        title: 'Home',
      ),
      body: Center(
        child: Text('Página da Home das Crianças'),
      ),
    );
  }
}
