import 'package:flutter/material.dart';
import '../widgets/boxselectorlogin.dart'; // Make sure this import is correct
import 'childrenPages/loginChildPage.dart';
import 'package:learn/widgets/loginEnterButton.dart';
import 'package:learn/widgets/loginAppBar.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String userType = 'aprendiz'; // valor padrão

  void _handleUserTypeChange(String type) {
    setState(() {
      userType = type;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            const LoginAppBar(),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'Bem-vindo à Coinny',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF646AE3),
                      fontFamily: "Fieldwork-Geo",
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const Text(
                    'Para iniciar sua sessão, selecione o seu tipo de perfil Soldi.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF5F5F5F),
                      fontFamily: "Fieldwork-Geo",
                      fontWeight: FontWeight.w400,
                    )
                  ),
                  const SizedBox(height: 32),
                  CustomRadioTile(
                    isSelected: userType == 'aprendiz',
                    onTap: () => _handleUserTypeChange('aprendiz'),
                    title: 'Sou aprendiz',
                  ),
                  const SizedBox(height: 16), // Space between the options
                  CustomRadioTile(
                    isSelected: userType == 'responsavel',
                    onTap: () => _handleUserTypeChange('responsavel'),
                    title: 'Sou responsável',
                  ),
                  const SizedBox(height: 32),
                  LoginEnterButton(
                    onPressed: () {
                      if (userType == 'aprendiz') {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginChildPage(),
                          ),
                        );
                      } else {
                        Navigator.pushReplacementNamed(
                            context, '/parentsMain');
                      }
                      },
                    title: "Continuar", 
                    colors: const [Color(0xFF646AE3), Color(0xFF262B91)]
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
