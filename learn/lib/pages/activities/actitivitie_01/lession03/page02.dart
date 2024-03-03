import 'package:flutter/material.dart';
import 'package:learn/widgets/global/backButton.dart';
import 'package:learn/widgets/global/commonButton.dart';

class CustomOptionButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomOptionButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Bold and larger font for the option text
    TextStyle optionTextStyle = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );

    // Highlighting specific parts of the text if needed
    List<TextSpan> textSpans = [];
    if (text.contains('R\$50')) {
      String firstPart = text.split('R\$50')[0];
      String secondPart = 'R\$50';
      String thirdPart = text.split('R\$50')[1];
      textSpans.addAll([
        TextSpan(text: firstPart, style: optionTextStyle),
        TextSpan(
            text: secondPart, style: optionTextStyle.copyWith(fontSize: 18)),
        TextSpan(text: thirdPart, style: optionTextStyle),
      ]);
    } else {
      textSpans.add(TextSpan(text: text, style: optionTextStyle));
    }

    return Container(
      width: double.infinity,
      height: 90, // Fixed height for the button
      margin: EdgeInsets.all(8), // Consistent margin for all buttons
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          side: BorderSide(color: Colors.white, width: 1),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Radio(
              value: false,
              groupValue: null,
              onChanged: (value) {},
              activeColor: Colors.white,
            ),
            SizedBox(width: 8),
            Expanded(
              child: RichText(
                text: TextSpan(
                  children: textSpans,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Page02 extends StatelessWidget {
  final PageController pageController;

  Page02({
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    const TextStyle textStyle = TextStyle(
        color: Color(0xFFFFFFFF),
        fontSize: 14,
        fontWeight: FontWeight.w500,
        fontFamily: "Fieldwork-Geo");

    double bottomPadding = MediaQuery.of(context).size.height *
        0.1; // Adjust the multiplier as needed

    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              colors: [
                Color(0XFF7A7FFF),
                Color(0XFF040862),
              ],
              begin: Alignment.topLeft,
              end: Alignment.centerRight,
            )),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 64,
                ),
                LearnBackButton(
                  buttonColor: const Color(0xFFFFFFFF),
                  iconColor: const Color(0xff101573),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),

                const SizedBox(
                  height: 48,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text:
                              'lorem ipsum dolor sit amet, consectetur adipiscing elit. ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: "Fieldwork-Geo",
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        TextSpan(
                          text:
                              "lorems ipsum dolor sit amet, consectetur adipiscing elit. ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: "Fieldwork-Geo",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                // This would be a custom widget to display the question and options
                _buildQuestion(context),
              ],
            ),
          ),
          // alguém aqui depois coloca padding de porcentagem, pq eu n sei fazer

          Positioned(
            bottom:
                bottomPadding, // Adjust this value to move the buttons up or down
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 16.0), // Keep the horizontal padding if needed
              child: Row(
                mainAxisAlignment: MainAxisAlignment
                    .spaceBetween, // This will place space evenly between your buttons
                children: [
                  LearnButton(
                    text: const Text(
                      "Voltar",
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Fieldwork-Geo",
                      ),
                    ),
                    buttonColor: Color.fromARGB(0, 255, 255, 255),
                    onPressed: () {
                      // Handle the logic for when a user selects an option
                      // For example, save the user's choice and navigate to the next page
                    },
                  ),
                  const Spacer(),
                  LearnButton(
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
                    onPressed: () {
                      pageController.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.ease);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuestion(BuildContext context) {
    // Replace with your custom question widget
    return Positioned(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: 'Quanto em dinheiro ela deveria levar para lanchar?',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: "Fieldwork-Geo",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Placeholder for options, you should replace this with your own custom widget
          ...List.generate(3, (index) => _buildOption(index, context)),
        ],
      ),
    );
  }

  Widget _buildOption(int index, BuildContext context) {
    // Define the options text based on the index
    String optionText = "";
    switch (index) {
      case 0:
        optionText = "R\$20";
        break;
      case 1:
        optionText = "R\$30";
        break;
      case 2:
        optionText = "R\$40";
        break;
      default:
        optionText =
            "Opção $index"; // Default text in case more options are added
    }

    TextStyle optionTextStyle = TextStyle(
      color: Colors.white,
      fontSize: 18,
    );

    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: SizedBox(
        height: 105, // Fixed height for the option button
        child: CustomOptionButton(
          text: optionText, // Pass the option text here
          onPressed: () {
            // Handle selection logic
          },
        ),
      ),
    );
  }
}
