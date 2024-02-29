import 'package:flutter/material.dart';
import 'package:learn/widgets/loginWidgets/loginInfoContainter.dart';
import 'package:learn/widgets/loginWidgets/loginEnterButton.dart';

class VerificationCodePage extends StatelessWidget {
  final String childrenName;

  VerificationCodePage({required this.childrenName});

  @override
  Widget build(BuildContext context) {
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
            // oi jvs: Fred poe aqui o os blocos do números
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
