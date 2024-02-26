import 'package:flutter/material.dart';
import '../../widgets/global/appBar.dart';

class ProfilePage extends StatelessWidget {
  final ValueNotifier<double> pagePosition;

  ProfilePage({
    required this.pagePosition
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LearnAppBar(
        pageIndex: 3,
        pagePosition: pagePosition.value,
        children: const [
          Text('Perfil', style: TextStyle(color: Colors.white)),
        ] 
      ),
      body: const Center(
        child: Text('Página do Perifl dos Pais'),
      ),
    );
  }
}
