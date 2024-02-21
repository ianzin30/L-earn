import 'package:flutter/material.dart';
import '/widgets/appBar.dart';

class MonitorigPage extends StatelessWidget {
  final ValueNotifier<bool> isRounded;

  MonitorigPage({
    required this.isRounded
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LearnAppBar(
        title: 'Monitoramento',
        isAppBarRounded: isRounded,
      ),
      body: Center(
        child: Text('Página de Monitoramento'),
      ),
    );
  }
}
