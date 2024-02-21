import 'package:flutter/material.dart';
import '/widgets/appBar.dart';

class MonitorigPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LearnAppBar(
        title: 'Monitoramento',
      ),
      body: Center(
        child: Text('Página de Monitoramento'),
      ),
    );
  }
}
