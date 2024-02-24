import 'package:flutter/material.dart';
import '../widgets/boxselectorlogin.dart'; // Make sure this import is correct
import 'childrenPages/loginChildPage.dart';

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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Image.asset('assets/images/appImages/icon.png', height: 40),
                const SizedBox(width: 8),
                const Text(
                  'Coinny',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color:
                        Color.fromARGB(255, 44, 52, 199), // Adicione a cor aqui
                  ),
                ),
              ],
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'Bem-vindo à Coinny',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF646AE3), // Adicione a cor aqui
                    ),
                  ),

                  const Text(
                    'Para iniciar sua sessão, selecione o seu tipo de perfil Soldi.',
                    textAlign: TextAlign.center,
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
                  Container(
                    width: 210,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      gradient: const LinearGradient(
                        colors: [
                          Color.fromARGB(
                              255, 44, 52, 199), // Start color of the gradient
                          Color.fromARGB(
                              255, 44, 52, 150), // End color of the gradient
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 3,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors
                            .transparent,         // Background color (transparent)
                        foregroundColor:
                            Colors.transparent, // Splash color (transparent)
                        shadowColor:
                            Colors.transparent, // Shadow color (transparent)
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: 0, // No elevation
                      ),
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
                      child: const Text(
                        'Continuar',
                        style: TextStyle(
                          fontSize: 18, // Adjust font size as needed
                          fontWeight: FontWeight.bold, // Font weight
                          color: Colors.white, // Text color
                        ),
                      ),
                    ),
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
