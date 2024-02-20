import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String userType = 'aprendiz'; // valor padrão

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/images/appImages/logo.png', height: 120), // Substitua pelo caminho do seu logotipo
            SizedBox(height: 48),
            Text(
              'Bem-vindo à Soldi',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24),
            RadioListTile<String>(
              title: const Text('Sou aprendiz'),
              value: 'aprendiz',
              groupValue: userType,
              onChanged: (value) => setState(() => userType = value!),
            ),
            RadioListTile<String>(
              title: const Text('Sou responsável'),
              value: 'responsavel',
              groupValue: userType,
              onChanged: (value) => setState(() => userType = value!),
            ),
            SizedBox(height: 32),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50), // width and height
              ),
              onPressed: () {
                if (userType == 'aprendiz') {
                  // Navegue para childrenMain.dart
                  Navigator.pushReplacementNamed(context, '/childrenMain');
                } else {
                  // Navegue para parentsMain.dart
                  Navigator.pushReplacementNamed(context, '/parentsMain');
                }
              },
              child: Text('Continuar'),
            ),
          ],
        ),
      ),
    );
  }
}
