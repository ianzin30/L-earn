import 'package:flutter/material.dart';
import '../../lessionsModels/questionPage.dart';
import '../../lessionsModels/mascotPage.dart';
import 'pageTexts.dart';
import '../../lessionsModels/completedActivityPage.dart';

double stringRealToDouble(String input) {
  RegExp regex = RegExp(r'R\$\s?(\d{1,3}(\.\d{3})*|\d+)(,\d{2})?');
  
  Iterable<RegExpMatch> matches = regex.allMatches(input);

  if (matches.isEmpty) return 0.0;

  String lastMatch = matches.last.group(0)!;

  String cleanedValue = lastMatch.replaceAll('R\$', '').trim().replaceAll(',', '.').replaceAll('.', '');

  double value = double.parse(cleanedValue);

  return value;
}


class Lession01Main extends StatefulWidget {
  @override
  _Lession01MainState createState() => _Lession01MainState();
}

class _Lession01MainState extends State<Lession01Main> {
  int _selectedIndex = 0;
  PageController _pageController = PageController();
  ValueNotifier<double> pagePosition = ValueNotifier(0.0);
  List<dynamic> respostas = ["pg3", "pg5", "pg7", "pg9", "pg11", "pg13"];
  Map<String, num> escolhas = {"ingresso" : 0.0, "lanche" : 0.0, "extra": 0.0, "total" : 0.0 };

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _selectedIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {



    List<Widget> _pageOptions = [
      MascotPage(
        pageController: _pageController, 
        text: pg1.text,
        isHappy: true,
      ),
      MascotPage(
        pageController: _pageController, 
        text: pg2.text,
        isHappy: false
      ),

      //Page03(pageController: _pageController),
      QuestionPage(
          pageController: _pageController,
          questionText: pg3.text,
          preOptionsText: pg3.preOptions,
          options: pg3.options,
          correctIndex: pg3.correct,
          onSelectedOptionChange: (str) {
            respostas[0] = str;
          }
      ),
      
      //Page04(pageController: _pageController),
      MascotPage(
        pageController: _pageController, 
        text: pg4.text,
        isHappy: true
      ),

      //Page05(pageController: _pageController),
      QuestionPage(
        pageController: _pageController, 
        questionText: pg5.text, 
        preOptionsText: pg5.preOptions, 
        options: pg5.options, 
        correctIndex: pg5.correct, 
        onSelectedOptionChange: (str) {
            respostas[1] = str;
            escolhas["ingresso"] = stringRealToDouble(str);
            escolhas["total"] = escolhas['ingresso']! + escolhas['lanche']!  + escolhas['extra']!;
        },
      ),
      
      //Page06(pageController: _pageController),
      MascotPage(
        pageController: _pageController, 
        text: pg6.text,
        isHappy: true
      ),

      //Page07(pageController: _pageController),
      QuestionPage(
        pageController: _pageController, 
        questionText: pg7.text, 
        preOptionsText: pg7.preOptions, 
        options: pg7.options, 
        correctIndex: pg7.correct, 
        onSelectedOptionChange: (str) {
            respostas[2] = str;
        },
      ),
      
      //Page08(pageController: _pageController),
      MascotPage(
        pageController: _pageController, 
        text: pg8.text,
        isHappy: true
      ),

      //Page09(pageController: _pageController),
      QuestionPage(
        pageController: _pageController, 
        questionText: pg9.text, 
        preOptionsText: pg9.preOptions, 
        options: pg9.options, 
        correctIndex: pg9.correct, 
        onSelectedOptionChange: (str) {
            respostas[3] = str; // Dinheiro do lanche
            escolhas["lanche"] = stringRealToDouble(str);
            escolhas["total"] = escolhas['ingresso']! + escolhas['lanche']!  + escolhas['extra']!;
        },
      ),

      //Page10(pageController: _pageController),
      MascotPage(
        pageController: _pageController, 
        text: pg10.text,
        isHappy: true
      ),

      //Page11(pageController: _pageController),
      QuestionPage(
        pageController: _pageController, 
        questionText: pg11.text, 
        preOptionsText: pg11.preOptions, 
        options: pg11.options, 
        correctIndex: pg11.correct, 
        onSelectedOptionChange: (str) {
            respostas[4] = str;
        },
      ),
      //Page12(pageController: _pageController),
      MascotPage(
        pageController: _pageController, 
        text: pg12.text,
        isHappy: true
      ),

      //Page13(pageController: _pageController),
      QuestionPage(
        pageController: _pageController, 
        questionText: pg13.text, 
        preOptionsText: pg13.preOptions, 
        options: pg13.options, 
        correctIndex: pg13.correct, 
        onSelectedOptionChange: (str) {
            respostas[5] = str; // Dineiro extra
            escolhas["extra"] = stringRealToDouble(str);
            escolhas["total"] = escolhas['ingresso']! + escolhas['lanche']!  + escolhas['extra']!;
        },
      ),
      //Page14(pageController: _pageController),
      MascotPage(
        pageController: _pageController,
        text: RichText(
                text:  TextSpan(
                    children: [
                      const TextSpan(
                        text:
                            "Boa, Laís! Agora, vamos só conferir quanto a Connie deveria levar para o passeio, no total? Aqui a lista dela:\n\n",
                      ),
                      TextSpan(
                              text : "Ingresso - R\$${escolhas['ingresso']}\n",
                              style: TextStyle(fontWeight: FontWeight.bold,),
                      ),
                      TextSpan(
                              text : "Lanche - R\$${escolhas['lanche']}\n",
                              style: TextStyle(fontWeight: FontWeight.bold,),
                      ),
                      TextSpan(
                              text : "Dinheiro extra para imprevistos - R\$${escolhas['extra']}\n\n",
                              style: TextStyle(fontWeight: FontWeight.bold,),
                      ),
                      const TextSpan(
                              text : "Ou seja, no total ela vai levar ",
                              style: TextStyle(fontWeight: FontWeight.bold,),
                      ),
                      TextSpan(
                              text : "R\$${escolhas['total']}",
                              style: TextStyle(fontWeight: FontWeight.bold,),
                      ),
                      const TextSpan(
                              text : " para o passeio!",
                              style: TextStyle(fontWeight: FontWeight.bold,),
                      )
                    ],
                    style:const  TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Fieldwork-Geo"),
                    
                    ),
                    textAlign: TextAlign.center,
                    ),
        
        ),
      
      FinalPage(pageController: _pageController)
    ];

    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: _pageOptions,
      ),
    );
  }
}
