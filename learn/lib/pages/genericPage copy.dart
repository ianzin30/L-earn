import 'package:flutter/material.dart';
import '../../widgets/global/learnAppBar.dart';

class GenericPageTemplate extends StatelessWidget {
  final ValueNotifier<double> pagePosition;

  GenericPageTemplate({
    required this.pagePosition
  });


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LearnAppBar(
        pageIndex: 0,
        pagePosition: pagePosition.value,
        child: const Text('Generic Page Template', style: TextStyle(color: Colors.white)),
      ),
      body: const Center(
        child: Text('Generic Page Template'),
      ),
    );
  }
}
