import 'package:flutter/material.dart';
import '/widgets/appBar.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LearnAppBar(
        title: 'Perfil',
      ),
      body: Center(
        child: Text('Página do Perifl dos Pais'),
      ),
    );
  }
}
