import 'package:flutter/material.dart';
import 'package:learn/utils/modelsClass.dart';
import 'package:learn/utils/animatedProgressBar.dart';

class LessionCardStatic extends StatelessWidget {
  final Lession lession;
  final bool isLocked;
  final bool isFinished;

  LessionCardStatic(
      {required this.lession,
      this.isLocked = true,
      this.isFinished = false,
      super.key});

  @override
  Widget build(BuildContext context) {
    final color = isLocked
        ? const Color(0xFF3C3C3C)
        : isFinished
            ? const Color(0xFF179A53)
            : const Color(0xFF4349B8);

    final width = MediaQuery.sizeOf(context).width;
    return InkWell(
      child: Container(
        padding: const EdgeInsets.all(16),
        width: width - 32,
        decoration: BoxDecoration(
            color: color.withOpacity(isFinished ? 0.3 : 0.0),
            border: Border.all(color: color, width: 1),
            borderRadius: BorderRadius.circular(10)
            ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                width: width * 0.6,
                child: RichText(
                  text: TextSpan(
                      children: [
                        TextSpan(
                          text: "${lession.title}\n\n",
                          style: const TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w700),
                        ),
                        TextSpan(
                          text: lession.description,
                          style: const TextStyle(
                              fontSize: 10, fontWeight: FontWeight.w300),
                        ),
                      ],
                      style: TextStyle(
                        fontFamily: "Fieldwork-Geo",
                        color: color,
                      )),
                )),
            Icon(
              isLocked
                  ? Icons.lock
                  : isFinished
                      ? Icons.check
                      : Icons.chevron_right,
              color: color,
              weight: 10,
            )
          ],
        ),
      ),
      onTap: () {
        print(isLocked);
        if (!isLocked && !isFinished) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => lession.page ?? Container()));
        }
      },
    );
  }
}