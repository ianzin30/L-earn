import 'package:flutter/material.dart';
import '../../widgets/global/learnAppBar.dart';

class ParentsHPage extends StatelessWidget {
  final ValueNotifier<double> pagePosition;

  ParentsHPage({
    required this.pagePosition
  });


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LearnAppBar(
        pageIndex: 0,
        pagePosition: pagePosition.value,
        children: const [
          Text('Home', style: TextStyle(color: Colors.white)),
        ] 
      ),
      body: const Center(
        child: Text('Home Page dos Pais'),
      ),
    );
  }
}
