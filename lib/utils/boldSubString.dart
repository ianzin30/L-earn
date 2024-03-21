import 'package:flutter/material.dart';

extension BoldSubString on Text {
  Text boldSubString(String target) {
    final textSpans = List.empty(growable: true);
    final escapedTarget = RegExp.escape(target);
    final pattern = RegExp(escapedTarget, caseSensitive: false);
    final matches = pattern.allMatches(data!);

    int currentIndex = 0;
    for (final match in matches) {
      final beforeMatch = data!.substring(currentIndex, match.start);
      if (beforeMatch.isNotEmpty) {
        textSpans.add(TextSpan(text: beforeMatch));
      }

      final matchedText = data!.substring(match.start, match.end);
      textSpans.add(
        TextSpan(
          text: matchedText,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      );

      currentIndex = match.end;
    }

    if (currentIndex < data!.length) {
      final remainingText = data!.substring(currentIndex);
      textSpans.add(TextSpan(text: remainingText));
    }

    return Text.rich(
      TextSpan(children: <TextSpan>[...textSpans]),
    );
  }
}


extension BoldSubStringOnTextSpan on TextSpan {
  TextSpan toBold(String target) {
    final textSpans = <TextSpan>[];

    final escapedTarget = RegExp.escape(target);

    final pattern = RegExp(escapedTarget, caseSensitive: false);

    String text = this.text ?? "";
    final matches = pattern.allMatches(text);

    int currentIndex = 0;
    for (final match in matches) {
      final beforeMatch = text.substring(currentIndex, match.start);
      if (beforeMatch.isNotEmpty) {
        textSpans.add(TextSpan(text: beforeMatch, style: this.style));
      }

      final matchedText = text.substring(match.start, match.end);
      textSpans.add(TextSpan(
        text: matchedText,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: this.style?.fontSize),
      ));

      currentIndex = match.end;
    }

    if (currentIndex < text.length) {
      final remainingText = text.substring(currentIndex);
      textSpans.add(TextSpan(text: remainingText, style: this.style));
    }

    return TextSpan(children: textSpans, style: this.style);
  }
}
