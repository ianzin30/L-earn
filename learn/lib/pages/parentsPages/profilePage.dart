import 'package:flutter/material.dart';
import '/widgets/appBar.dart';

class ProfilePage extends StatelessWidget {
  final ValueNotifier<bool> isRounded;

  ProfilePage({
    required this.isRounded
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LearnAppBar(
        title: 'Perfil',
        isAppBarRounded: isRounded,
      ),
      body: Center(
        child: Text('Página do Perifl dos Pais'),
      ),
    );
  }
}
