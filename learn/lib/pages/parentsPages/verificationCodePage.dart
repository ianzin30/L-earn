import 'package:flutter/material.dart';
import 'package:learn/widgets/loginWidgets/loginInfoContainter.dart';
import 'package:learn/widgets/loginWidgets/loginEnterButton.dart';

class VerificationCodePage extends StatelessWidget {
  final String childrenName;

  VerificationCodePage({required this.childrenName});

  @override
  Widget build(BuildContext context) {
  const List<int> verficationCode = [1,2,3,4];

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/appIcons/check-circle.png",
              width: 120,
            ),
            const SizedBox(height: 24),
            LoginInfoContainer(
              title: "Conta criada com sucesso", 
              description: "O código abaixo deverá ser utilizado por $childrenName\nao entrar na Coinny, lembre de guardar esta\nchave!"
            ),
            const SizedBox(height: 24),
            Row(
              children: verficationCode.map((e) => Container(
                width: 64, height: 80,
                decoration: BoxDecoration(
                  color: const Color(0xFFFFFFFF),
                ),
                child: Center(
                  child: Text(e.toString()),
                ),
              )).toList(),
            ),
            const SizedBox(height: 80),
            LoginEnterButton(
              title: "Voltar ao início", 
              onPressed: (){
                Navigator.pop(context);
                Navigator.pop(context);
              }, 
            )
          ],
        )
      ),
    );
  }
}
