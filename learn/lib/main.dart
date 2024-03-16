import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:learn/firebase_options.dart';
import 'pages/loginPage.dart';
import 'parentsMain.dart';
import 'childrenMain.dart';
import 'pages/parentsPages/SignUpParentsPage.dart';
import 'package:learn/utils/modelsClass.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final VolatileChildren childUser = VolatileChildren(children: luciano);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<VolatileChildren>(
        create: (context) => VolatileChildren(children: luciano),
        child: MaterialApp(
          title: 'Coinny',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: LoginPage(),
          routes: {
            '/parentsMain': (context) => ParentsMain(
                  parent: joana,
                ),
            '/childrenMain': (context) => ChildrenMain(child: luciano),
            '/signUpParents': (context) => SignParentsPage(),
          },
        ));
  }
}
