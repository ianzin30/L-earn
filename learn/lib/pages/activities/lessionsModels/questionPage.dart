import 'package:flutter/material.dart';
import 'package:learn/widgets/global/backButton.dart';
import 'package:learn/widgets/global/commonButton.dart';
import 'package:learn/widgets/activitiesWidgets/questionRadioTile.dart';

class QuestionPage extends StatefulWidget {
  final PageController pageController;
  final RichText questionText;
  final RichText preOptionsText;
  final List<String> options;
  final int correctIndex;
  final ValueChanged<String> onSelectedOptionChange;

  QuestionPage({
    required this.pageController,
    required this.questionText,
    required this.preOptionsText,
    required this.options,
    required this.correctIndex,
    required this.onSelectedOptionChange,
  });

  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  int selecionada = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0XFF646AE3),
                Color(0XFF262B91),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            const SizedBox(
              height: 120,
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height - 360,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  widget.questionText,
                  const SizedBox(height: 32,),
                  _buildQuestion(context),
                ],
              ),
            )
          ]),
        ),
        Positioned(
            top: 88,
            left: 16,
            child: LearnBackButton(
              buttonColor: const Color(0xFFFFFFFF),
              iconColor: const Color(0xff101573),
              onPressed: () {
                Navigator.pop(context);
              },
            )),
        Positioned(
          bottom: 120,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LearnButton(
                  text: const Text(
                    "Voltar",
                    style: TextStyle(
                      color: Color(0XFFFFFFFF),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Fieldwork-Geo",
                    ),
                  ),
                  buttonColor: const Color(0x00000000),
                  width: 120,
                  onPressed: () {
                    widget.pageController.previousPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.ease);
                  },
                ),
                const Spacer(),
                LearnButton(
                  borderRadius: 25,
                  text: const Text(
                    "Continuar",
                    style: TextStyle(
                      color: Color(0xff101573),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Fieldwork-Geo",
                    ),
                  ),
                  buttonColor: const Color(0xFFFFFFFF),
                  width: 120,
                  onPressed: () {
                    widget.pageController.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.ease);
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    ));
  }

  Widget _buildQuestion(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: widget.preOptionsText,
        ),
        Column(
          children: widget.options.asMap().entries.map((entry) {
            int idx = entry.key;
            String text = entry.value;
            return _buildOption(idx, text, context);
          }).toList(),
        )
      ],
    );
  }

  Widget _buildOption(int index, String text, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: QuestionRadioTile(
        title: text,
        isSelected: selecionada == index,
        isCorrect: widget.correctIndex == index,
        onTap: () {
          setState(() {
            selecionada = index;
            widget.onSelectedOptionChange(text);
          });
        },
      ),
    );
  }
}
