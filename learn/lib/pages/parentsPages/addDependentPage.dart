import 'package:flutter/material.dart';
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
              padding: EdgeInsets.all(16.0),
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
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: TextField(
                        controller: _nomeCrianca,
                        decoration: InputDecoration(
                          border: InputBorder.none, // Remove a borda padrão do TextField
                          labelText: 'Nome do Dependente',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 8.0), // Espaço entre os campos
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: TextField(
                        controller: _dataNascimento,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          labelText: 'Data de Nascimento',
                        ),
                        keyboardType: TextInputType.datetime,
                      ),
                    ),
                  ),
                  // ... (Texto do objetivo de aprendizado)
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Wrap(
                      children: conteudosDisponiveis.map((conteudo) {
                        return ChoiceChip(
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
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
            // ... (resto do seu código)
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

