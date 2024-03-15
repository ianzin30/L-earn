import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:learn/firebase_options.dart';
import 'pages/loginPage.dart';
import 'parentsMain.dart';
import 'childrenMain.dart';
import 'pages/parentsPages/SignUpParentsPage.dart';
import 'package:learn/utils/modelsClass.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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
        '/parentsMain': (context) => ParentsMain(
              parent: currentUser,
            ), // Rota para a home dos pais
        '/childrenMain': (context) =>
            ChildrenMain(child: luciano), // Rota para a home das crianças
        '/signUpParents': (context) =>
            SignParentsPage(), // Rota para a página de cadastro dos pais
      },
    );
  }
}
