import 'package:flutter/material.dart';
import 'package:learn/widgets/global/backButton.dart';
import 'package:learn/widgets/global/commonButton.dart';

class CustomOptionButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomOptionButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  _CustomOptionButtonState createState() => _CustomOptionButtonState();
}

class _CustomOptionButtonState extends State<CustomOptionButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 200), // Duration of the color transition
      vsync: this,
    );

    _colorAnimation = ColorTween(
      begin: Colors.transparent, // Initial color
      end: Colors.white, // Final color when pressed
    ).animate(_controller);

    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onPressed() {
    if (_controller.isCompleted) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
    widget.onPressed();
  }

  @override
  Widget build(BuildContext context) {
    TextStyle optionTextStyle = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );

    // Highlighting specific parts of the text if needed
    List<TextSpan> textSpans = [];
    if (widget.text.contains('R\$50')) {
      String firstPart = widget.text.split('R\$50')[0];
      String secondPart = 'R\$50';
      String thirdPart = widget.text.split('R\$50')[1];
      textSpans.addAll([
        TextSpan(text: firstPart, style: optionTextStyle),
        TextSpan(
            text: secondPart, style: optionTextStyle.copyWith(fontSize: 18)),
        TextSpan(text: thirdPart, style: optionTextStyle),
      ]);
    } else {
      textSpans.add(TextSpan(text: widget.text, style: optionTextStyle));
    }

    return GestureDetector(
      onTap: _onPressed,
      child: AnimatedBuilder(
        animation: _colorAnimation,
        builder: (context, child) {
          return Container(
            width: double.infinity,
            height: 90,
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: _colorAnimation.value ??
                  Colors
                      .transparent, // Fallback to transparent if _colorAnimation.value is null
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.white, width: 1),
            ),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
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
          );
        },
      ),
    );
  }
}
