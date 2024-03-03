import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:learn/utils/modelsClass.dart';
import 'package:learn/widgets/global/learnAppBar.dart';
import '/widgets/selectedGoals.dart';
import '/widgets/childrenDataBox.dart';
import 'package:learn/widgets/login/loginEnterButton.dart';
import 'package:learn/pages/parentsPages/verificationCodePage.dart';

class AddDependentPage extends StatefulWidget {
  final Children? children;

  AddDependentPage({
    this.children,
  });

  @override
  _AddDependentPageState createState() => _AddDependentPageState();
}

class _AddDependentPageState extends State<AddDependentPage> {
  final TextEditingController _nomeCriancaController = TextEditingController();
  final TextEditingController _dataNascimentoController = TextEditingController();
  List<String> _conteudosSelecionados = [];
  List<String> _conteudosDisponiveis = [
    "Conteúdos básicos", "Finanças", "Investimentos", "Juros", "Poupança"
  ];

  @override
  void initState() {
    super.initState();
    if (widget.children != null) {
      _nomeCriancaController.text = widget.children!.name;
      _dataNascimentoController.text = DateFormat('dd/MM/yyyy').format(widget.children!.birthdate);
      _conteudosSelecionados = widget.children!.goals;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LearnAppBar(
        heigth: 180,
        backButtonFunction: () {
          Navigator.pop(context);
        },
        gradient: const LinearGradient(
          colors:  [Color(0xFF7A7FFF), Color(0xFF040862)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight
        ),
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            ChildrenDataBox(
              nameController: _nomeCriancaController,
              dateController: _dataNascimentoController,
              initialName: widget.children?.name,
              initialDate: widget.children?.birthdate != null
                  ? DateFormat('dd/MM/yyyy').format(widget.children!.birthdate)
                  : null,
            ),
            const SizedBox(height: 32),
            SelectedGoals(
              availableGoals: _conteudosDisponiveis,
              selectedGoals: _conteudosSelecionados,
            ),
            const SizedBox(height: 32),
            Center(
              child: LoginEnterButton(
                title: "Salvar",
                colors: const [Color(0xFF646AE3), Color(0xFF262B91)],
                onPressed: _saveDependent,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _saveDependent() {
    print('Dependente salvo:');
    print('Nome: ${_nomeCriancaController.text}');
    print('Data de Nascimento: ${_dataNascimentoController.text}');
    print('Conteúdos Selecionados: $_conteudosSelecionados');
    Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => VerificationCodePage(childrenName: _nomeCriancaController.text))
              );
  }

  @override
  void dispose() {
    _nomeCriancaController.dispose();
    _dataNascimentoController.dispose();
    super.dispose();
  }
}
