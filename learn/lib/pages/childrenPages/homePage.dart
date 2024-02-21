import 'package:flutter/material.dart';
import '/widgets/appBar.dart';

class ChildrenHomePage extends StatelessWidget {
  final ValueNotifier<bool> isRounded;

  ChildrenHomePage({
    required this.isRounded
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LearnAppBar(
        title: 'Home',
        isAppBarRounded: isRounded,
      ),
      body: Center(
        child: Text('Página da Home das Crianças'),
      ),
    );
  }
}
