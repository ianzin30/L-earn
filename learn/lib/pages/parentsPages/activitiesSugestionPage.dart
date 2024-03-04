import 'package:flutter/material.dart';
import '../../widgets/global/learnAppBar.dart';
import 'package:learn/widgets/StreakWidget.dart';
import 'package:learn/widgets/activitiesWidgets/trilhaSoldi.dart';
import '/widgets/achivievementWidget.dart';
import 'package:learn/widgets/user-profile.dart';
import 'package:learn/widgets/globalProgressWidget.dart';
import 'package:learn/utils/modelsClass.dart';
import 'package:learn/widgets/activitiesWidgets/activitieCardStatic.dart';


class ActivitiesSugestionPage extends StatelessWidget {
  final Children children;

  const ActivitiesSugestionPage({
    required this.children,
    Key? key,
    })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LearnAppBarSuper(
        superHeigth: 400  - 24,
        globalHeigth: 360 - 24,
        superWidget: GlobalProgress(pontuation: children.pontuation, isMascot: false,),
        pageIndex: 1,
        backButtonFunction: () {
          Navigator.pop(context);
        },
        child: Container(
          padding: const  EdgeInsets.fromLTRB(14, 32, 14, 0),
          child: 
          Column (children: [
          const Text("Sugestão de Atividades",
          style: TextStyle(
            fontSize: 18,
            fontFamily: "Fieldwork-Geo",
            fontWeight: FontWeight.w700,
            color: Color(0xFFFFFFFF)
          ),),
          const SizedBox(height: 54,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              UserPhotoAndName(
                userName: children.name,
                userPhotoPath: children.photoPath,
                firstLine: '${children.name}\n',
                fontWeight1: FontWeight.bold,
                secondLine: "${diffYears(children.birthdate)} anos",
                fontWeight2: FontWeight.w400,
              ),
              StreakWidget(streakDays: diffDays(children.lastAccsess?? DateTime.now())),
            ]
          )
          ],)
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(text:TextSpan(
              children: [
              const TextSpan(text: "Aprendizado da seção\n", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14 )),
              const WidgetSpan(child: SizedBox(height: 32)),
              TextSpan(text: "O ${children.name} recentemente concluiu a tarefa de ",),
              const TextSpan(text: "Orçamento de um passeio no Shopping ", style: TextStyle(fontWeight: FontWeight.bold)),
              const TextSpan(text: "do Coinny, e aprendeu os seguintes conceitos:\n"),
              const WidgetSpan(child: SizedBox(height: 32)),
              const TextSpan(text: " *  Pesquisa de preços dos produtos desejados\n"),
              const TextSpan(text: " *  Criação de orçamentos\n"),
              const TextSpan(text: " *  Lidando com imprevistos no orçamento\n"),
              const WidgetSpan(child: SizedBox(height: 32)),
              const TextSpan(text: "Ele agora é capaz de "),
              const TextSpan(text: "comparar preços para tomada de decisão, criar orçamentos simples e considerar imprevistos durante esse processo de criação!", 
                            style: TextStyle(fontWeight: FontWeight.bold)),
              const TextSpan(text: "Mas é importante sempre praticar - e por que não fazer isso em família?"),
              
              ],
          style: const TextStyle(
                fontSize: 12,
                fontFamily: "Fieldwork-Geo",
                fontWeight: FontWeight.w400,
                color: Color(0xFF000000))),
            ),
            const SizedBox(height: 54),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                
                SizedBox(
                  height: 48,
                  width: 56,
                  child: Image.asset(
                  "assets/images/appImages/AppIconBalloon.png",
                  height: 48,
                ),
                ),
                const SizedBox(width: 8,),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width - 108,
                  child: RichText(text: TextSpan(children: [
                    TextSpan(text: "Então aqui vai um desafio: Planeje, junto com o ${children.name}, o " ),
                    const TextSpan(text: "Orçamento de um passeio em família!\n" , style: TextStyle(color: Color(0xFF282C93), fontWeight: FontWeight.bold)),
                    const TextSpan(text: "Não se preocupe, a gente te ajuda :)" )
                  ],
                  style: const TextStyle(color: Color(0xFF0000000), fontWeight: FontWeight.w400, fontSize: 12, fontFamily: "Fieldwork-Geo")
                  ),
                  textAlign: TextAlign.justify),
                ),
              ]
            ),

            // Container da sugestão

            const SizedBox(height: 54),
            
            Container(
              alignment: Alignment.centerLeft,
              height: 70,
              width: 362,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color(0xFF4B50C0),
                borderRadius: BorderRadius.circular(10)
              ),
              child: RichText(
                text: const TextSpan(
                children: [
                  TextSpan(text: "Sugestão de Atividade\n", style: TextStyle(color: Color(0xFFFFFFFF), fontWeight: FontWeight.w400, fontSize: 12, fontFamily: "Fieldwork-Geo")),
                  WidgetSpan(child: SizedBox(height: 24)),
                  TextSpan(text: "Orçamento de um passeio em família", style: TextStyle(color: Color(0xFFFFFFFF), fontWeight: FontWeight.bold, fontSize: 12, fontFamily: "Fieldwork-Geo")),
                ]),
                //textAlign: TextAlign.start,
              ),
            
            ),

            const SizedBox(height: 54),
            const Bloquinho(
              number: 1,
              text:  [
                TextSpan(text: "Você pode começar definindo com seu filho qual o "),
                TextSpan(text: "local do passeio" , style: TextStyle(color: Color(0xFF282C93), fontWeight: FontWeight.bold)),
                TextSpan(text: "- cinema, restaurante, parque de diversões, parque aquático, qualquer local que seja divertido para um passeio em família! Vamos exemplificar com um passeio a um restaurante, está bem?" )
              ]
            ),
            const SizedBox(height: 24),
            const Bloquinho(
              number: 2,
              text:  [
                TextSpan(text: "Depois de decidir o tipo de passeio, é hora de "),
                TextSpan(text: "escolher o destino: ", style: TextStyle(color: Color(0xFF282C93), fontWeight: FontWeight.bold)),
                TextSpan(text: "vocês vão a um restaurante - mas qual restaurante? E aí vem a etapa de pesquisa! Aqui, é hora de buscar um espaço legal, com uma boa comida e que esteja em uma faixa de preço que cabe no bolso da família. Calma, temos uma dica: quando a gente pesquisa o nome de um restaurante no Google, ele indica a faixa de preço do estabelecimento bem juntinho das avaliações!"),
              ]
            ),
            const SizedBox(height: 24),
            const Bloquinho(
              number: 3,
              text:  [
                TextSpan(text: "Agora que vocês já sabem para onde vão, é hora de", style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: " mapear os custos.\n\n", style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF282C93) )),
                TextSpan(text: " Ou seja, colocar na ponta do lápis os gastos com o restaurante, assim como os gastos estimados com transporte, por exemplo!\n\nSe a faixa de preço do restaurante for, por exemplo, R\$40-R\$60, o preço médio dos pratos costuma variar entre R\$40 e R\$60, e portanto, o ideal é considerar o valor mais alto para evitar imprevistos."),
              ]
            ),
            const SizedBox(height: 24),
            const Bloquinho(
              number: 4,
              text:  [
                TextSpan(text: "Replanejem se for preciso!\n\n", style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: "Caso o orçamento estimado fique alto demais, replanejar é uma ótima ideia. E só lembrando, montar um orçamento não significa que tudo o que foi estimado vai ser gasto, mas que vocês terão mais controle sobre o quanto gastarão."),
              ]
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 48,
                  width: 56,
                  child: Image.asset(
                  "assets/images/appImages/AppIconBalloon.png",
                  height: 48,
                ),
                ),
                const SizedBox(width: 8,),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width - 108,
                  child: RichText(
                    text: const TextSpan(
                      text: "É isso! Sucesso na sua jornada orçamentária - esperamos que se divirtam no processo!", 
                      style: TextStyle(color: Color(0xFF000000), fontWeight: FontWeight.w400, fontSize: 12, fontFamily: "Fieldwork-Geo") 
                    ),
                  textAlign: TextAlign.justify),
                ),
              ]
            ),
          ],
        ),
      ),
    );
  }
}

class Bloquinho extends StatelessWidget {
  final int number;
  final List<TextSpan> text;
  const Bloquinho({
    required this.number,
    required this.text,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 40,
                  width: 40,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color(0xFF4B50C0),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child:  Text("$number",
                  style: const TextStyle(color: Color(0xFFFFFFFF), fontWeight: FontWeight.w400, fontSize: 16, fontFamily: "Fieldwork-Geo"),),
                ),
                const SizedBox(width: 8,),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width - 96,
                  child: RichText(
                    text: TextSpan( children: text, style: const TextStyle(color: Color(0xFF0000000), fontWeight: FontWeight.w400, fontSize: 12, fontFamily: "Fieldwork-Geo") ),textAlign: TextAlign.justify),
                ),
              ],
            );
  }
}