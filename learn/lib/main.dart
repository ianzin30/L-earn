import 'package:flutter/material.dart';
import 'pages/loginPage.dart';
import 'parentsMain.dart';
import 'childrenMain.dart';

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
        '/parentsMain': (context) => ParentsMain(), // Rota para a home dos pais
        '/childrenMain': (context) => ChildrenMain(), // Rota para a home das crianças
      },
    );
  }
}
