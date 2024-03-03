import 'package:flutter/material.dart';
import 'pages/loginPage.dart';
import 'parentsMain.dart';
import 'childrenMain.dart';
import 'package:learn/utils/modelsClass.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'L-earn App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginPage(), // Começa com a página de login
      routes: {
        '/parentsMain': (context) => ParentsMain(parent: joana,), // Rota para a home dos pais
        '/childrenMain': (context) => ChildrenMain(child: luciano), // Rota para a home das crianças
      },
    );
  }
}
