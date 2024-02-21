import 'package:flutter/material.dart';
import '/widgets/appBar.dart';

class ParentsHPage extends StatelessWidget {
  final ValueNotifier<bool> isRounded;

  ParentsHPage({
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
        child: Text('Home Page dos Pais'),
      ),
    );
  }
}
