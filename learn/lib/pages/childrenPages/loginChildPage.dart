import 'package:flutter/material.dart';
import '../../widgets/boxselectorlogin.dart';

class LoginChildPage extends StatefulWidget {
  @override
  _LoginChildPageState createState() => _LoginChildPageState();
}

class _LoginChildPageState extends State<LoginChildPage> {
  List<String> values = List.filled(4, '');

  // Lista de controladores de texto das caixas
  List<TextEditingController> controllers = List.generate(
    4,
    (index) => TextEditingController(),
  );

  // Lista de focos das caixas
  List<FocusNode> focuses = List.generate(
    4,
    (index) => FocusNode(),
  );

  @override
  void initState() {
    super.initState();
    // Adiciona um listener para cada controlador de texto
    for (int i = 0; i < 4; i++) {
      controllers[i].addListener(() {
        // Pega o valor digitado
        String value = controllers[i].text;
        // Verifica se é um número válido
        if (value.isNotEmpty && int.tryParse(value) != null) {
          // Atualiza o valor da lista
          setState(() {
            values[i] = value;
          });
          // Muda o foco para a próxima caixa, se houver
          if (i < 3) {
            FocusScope.of(context).requestFocus(focuses[i + 1]);
          }
        }
      });
    }
  }

  @override
  void dispose() {
    // Descarta os controladores de texto e os focos
    for (int i = 0; i < 4; i++) {
      controllers[i].dispose();
      focuses[i].dispose();
    }
    super.dispose();
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
                    'Código de acesso',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF646AE3), // Adicione a cor aqui
                    ),
                  ),
                  const Text(
                    'O seu código de acesso pode ser retirado com os seus responsáveis',
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    children: List.generate(
                      4,
                      (index) => Expanded(
                        child: AspectRatio(
                          aspectRatio: 1 / 1,
                          child: Container(
                            margin: const EdgeInsets.all(4.0),
                            // Define o width e o height da caixa
                            width: MediaQuery.of(context).size.width * 0.2,
                            height: MediaQuery.of(context).size.height * 0.1,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(
                                color: Colors.grey.shade300, // Cor da borda
                                width: 2, // Largura da borda
                              ),
                            ),
                            child: Center(
                              child: TextField(
                                // Aceita apenas números
                                keyboardType: TextInputType.number,
                                // Limita o comprimento máximo para 1
                                maxLength: 1,
                                // Estilo do texto
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 32.0,
                                  fontWeight: FontWeight.bold,
                                ),
                                // Estilo do cursor
                                cursorColor: Colors.black,
                                // Estilo da borda
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  counterText: '',
                                  // Adiciona um placeholder com zeros da cor da borda
                                  hintText: '0',
                                  hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 32.0,
                                  ),
                                ),
                                // Controlador do valor
                                controller: controllers[index],
                                // Foco do campo
                                focusNode: focuses[index],
                                // Centraliza o valor digitado
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32.0),
                  Container(
                      width: 210,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        gradient: const LinearGradient(
                          colors: [
                            Color.fromARGB(255, 44, 52,
                                199), // Start color of the gradient
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
                              offset: const Offset(0, 3)),
                        ],
                      ),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors
                                .transparent, // Background color (transparent)
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
                            if (values.join() == '0000') {
                              Navigator.pushReplacementNamed(
                                  context, '/childrenMain');
                            }
                          },
                          child: const Text(
                            'Entrar',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ))),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
