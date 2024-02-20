import 'package:flutter/material.dart';
import '/widgets/appBar.dart';

class ChildrenHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LearnAppBar(
        title: 'Atividades',
      ),
      body: Center(
        child: Text('Atividades Content'),
      ),
    );
  }
}
