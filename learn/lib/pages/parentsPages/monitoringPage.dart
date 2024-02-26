import 'package:flutter/material.dart';
import '../../widgets/global/appBar.dart';

class MonitorigPage extends StatelessWidget {
  final ValueNotifier<double> pagePosition;

  MonitorigPage({
    required this.pagePosition
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LearnAppBar(
        pageIndex: 2,
        pagePosition: pagePosition.value,
        children: const [
          Text('Monitoramento', style: TextStyle(color: Colors.white)),
        ] 
      ),
      body: const Center(
        child: Text('Página de Monitoramento'),
      ),
    );
  }
}
