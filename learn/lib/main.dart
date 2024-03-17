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
          title: 'Coinny',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: LoginPage(),
          routes: {
            '/parentsMain': (context) => ParentsMain(),
            '/childrenMain': (context) => ChildrenMain(),
            '/signUpParents': (context) => SignParentsPage(),
          },
        );
  }
}
