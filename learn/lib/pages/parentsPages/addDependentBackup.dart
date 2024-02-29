import 'package:flutter/material.dart';
import '../../widgets/global/learnAppBar.dart';
import 'package:learn/utils/childrenClass.dart';


const List<String> conteudosDisponiveis = [
  "Conteúdos básicos", "Finanças", "Invstimentos", "Juros", "Popança"
];

class AddDependentPage extends StatelessWidget {
  final ValueNotifier<double> pagePosition;
  final Children? children;


  AddDependentPage({
    required this.pagePosition,
    this.children
  });

  final TextEditingController _nomeCrianca = TextEditingController(text: "Nome da Criança");
  final TextEditingController _dataNascimento = TextEditingController(text: "Data de Nascimento");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LearnAppBar(
        pageIndex: 0,
        pagePosition: pagePosition.value,
        backButtonFunction: () {
          Navigator.pop(context);
        },
        child: Container(
          alignment: Alignment.topCenter,
          padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
          child: const Text(
            "Adicionar dependente",
            style: TextStyle(
              fontFamily: "Fieldwork-Geo", fontWeight: FontWeight.w600, fontSize: 18, color: Color(0xFFFFFFFF)
            ),
          ),
        ),
      ),
      body: Column(
        children:[
          Container(
            child: Column(
              children: [
                const Text(
                  "Dados do dependente",
                  style: TextStyle(fontFamily: "Fieldwork-Geo", fontWeight: FontWeight.bold, fontSize: 14, color: Color(0xFF3C3C3C)),
                ),
                Text(
                  "Adicione o nome e a data de nascimento do\nseu dependente",
                  style: TextStyle(fontFamily: "Fieldwork-Geo", fontWeight: FontWeight.w500, fontSize: 12, color: Color(0xFF5C5C5C))
                ),
                // Adicione aqui dois campos para entrada de texto no formato que a imagem está, com u nome e data de nascimento
            ]),
          ),
          const SizedBox(height: 32), 
          
          Column(
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
              // Adicione aqui uma caixa de seleção que o que pode ser selecionado é o que está em conteudosDisponíveis
            ],
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _nomeCrianca.dispose();
    _dataNascimento.dispose();
  }
}