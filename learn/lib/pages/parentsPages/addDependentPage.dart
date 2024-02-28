import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../widgets/global/learnAppBar.dart';
import 'package:learn/utils/childrenClass.dart';

const List<String> conteudosDisponiveis = [
  "Conteúdos básicos", "Finanças", "Investimentos", "Juros", "Poupança"
];

class AddDependentPage extends StatefulWidget {
  final ValueNotifier<double> pagePosition;
  final Children? children;

  AddDependentPage({
    required this.pagePosition,
    this.children,
  });

  @override
  _AddDependentPageState createState() => _AddDependentPageState();
}

class _AddDependentPageState extends State<AddDependentPage> {
  final TextEditingController _nomeCrianca = TextEditingController();
  final TextEditingController _dataNascimento = TextEditingController();
  List<String> _conteudosSelecionados = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LearnAppBar(
        pageIndex: 0,
        pagePosition: widget.pagePosition.value,
        child: Container(
          alignment: Alignment.topCenter,
          padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
          child: const Text(
            "Adicionar dependente",
            style: TextStyle(
              fontFamily: "Fieldwork-Geo",
              fontWeight: FontWeight.w600,
              fontSize: 18,
              color: Color(0xFFFFFFFF),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ... (Texto dos dados do dependente)
                  Container(
                    decoration: BoxDecoration(
                      // Adiciona uma borda e um arredondamento ao Container
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: TextField(
                        controller: _nomeCrianca,
                        decoration: const InputDecoration(
                          border: InputBorder.none, // Remove a borda padrão do TextField
                          labelText: 'Nome do Dependente',
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8.0), // Espaço entre os campos
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xFF9A9A9A)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: TextField(
                        controller: _dataNascimento,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          labelText: 'Data de Nascimento',
                        ),
                        keyboardType: TextInputType.datetime,
                      ),
                    ),
                  ),
                  const SizedBox(height: 32), // Espaço entre os campos
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: "Objetivo de aprendizado\n",
                              style: TextStyle(
                                color: Color(0xFF3C3C3C),
                                fontSize: 14,
                                fontFamily: "Fieldwork-Geo",
                                fontWeight: FontWeight.bold
                              )
                            ),
                            TextSpan(
                              text: "Selecione os tópicos de estudo mais\nimportante para o seu dependente",
                              style: TextStyle(
                                color: Color(0xFF5C5C5C),
                                fontSize: 12,
                                fontFamily: "Fieldwork-Geo",
                                fontWeight: FontWeight.w500
                              )
                            ),
                          ]
                        )
                      ),
                      const SizedBox(height: 16), // Espaço entre os campos
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xFF9A9A9A)),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        width: MediaQuery.of(context).size.width - 28, // 20 pixels de margem em cada lado
                        child: Wrap(
                          direction: Axis.horizontal, // Itens são dispostos horizontalmente, mas quebram em linhas
                          spacing: 8.0, // Espaço horizontal entre os chips
                          runSpacing: 4.0, // Espaço vertical entre as linhas
                          children: conteudosDisponiveis.map((conteudo) {
                            return FilterChip(
                              label: Text(conteudo),
                              selected: _conteudosSelecionados.contains(conteudo),
                              onSelected: (bool selected) {
                                  setState(() {
                                    if (selected) {
                                      _conteudosSelecionados.add(conteudo);
                                    } else {
                                      _conteudosSelecionados.removeWhere((String name) {
                                        return name == conteudo;
                                      });
                                    }
                                  });
                              },
                              deleteIcon: _conteudosSelecionados.contains(conteudo) ? const Icon(Icons.cancel) : null,
                              onDeleted: () {
                                setState(() {
                                  _conteudosSelecionados.removeWhere((String name) {
                                    return name == conteudo;
                                  });
                                });
                              },
                              // Adicione os outros estilos necessários aqui
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 48), // Espaço entre os campos
                  Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xFF9B64E3), // Cor inicial do gradiente
                          Color(0xFF262B91), // Cor final do gradiente
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(46.0), // Arredondamento do botão
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        // Adicione a lógica para salvar os dados aqui
                      },
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(185.0, 40.0),
                        backgroundColor: Colors.transparent, // Deixa o fundo do botão transparente
                        shadowColor: Colors.transparent, // Sem sombra
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(46.0),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
                      ),
                      child: const Text(
                        'Salvar',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Fieldwork-Geo",
                          color: Colors.white, // Aqui você define a cor do texto
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

  @override
  void dispose() {
    _nomeCrianca.dispose();
    _dataNascimento.dispose();
    super.dispose();
  }
}

