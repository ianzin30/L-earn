import 'package:flutter/material.dart';
import 'package:learn/widgets/loginEnterButton.dart';
import 'package:learn/widgets/loginAppBar.dart';

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
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            const LoginAppBar(),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'Código de acesso',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF646AE3),
                      fontSize: 24,
                      fontFamily: "Fieldwork-Geo",
                    ),
                  ),
                  const SizedBox(height: 24.0),
                  const Text(
                    'O seu código de acesso pode ser retirado com os seus responsáveis',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF5F5F5F),
                      fontFamily: "Fieldwork-Geo",
                      fontSize: 16,
                      fontWeight: FontWeight.w400
                    )
                  ),
                  const SizedBox(height: 32.0),
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
                  const SizedBox(height: 54.0),
                  LoginEnterButton(
                    onPressed: () {
                            if (values.join() == '0000') {
                              Navigator.pushReplacementNamed(
                                  context, '/childrenMain');
                            }
                          }, 
                    title: "Entrar",
                    colors: values[3] != '' ? const [Color(0xFF646AE3), Color(0xFF262B91)] :  const [Color(0xff808080), Color(0xff808080)]
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
