import 'package:flutter/material.dart';
import 'package:learn/utils/animatedProgressBar.dart';
import 'package:learn/utils/modelsClass.dart';
import 'dart:ui';

class ActivitieCardStatic extends StatelessWidget {
  final Activitie activitie;
  final double progress;
  bool isLocked;


  ActivitieCardStatic({
    required this.activitie,
    this.isLocked = true,
    this.progress = 0
  });

  @override
  Widget build(BuildContext context) {
    double widgetWidth = MediaQuery.of(context).size.width -32;
    return Container(
          width: widgetWidth,
          height: 130,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            gradient: LinearGradient(
              colors: isLocked ? const [Color(0xFFC3C3C3), Color(0xFFC3C3C3)] : activitie.backgroundColors,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                offset: const Offset(0, 4),
                blurRadius: 10,
              ),
            ],
          ),
          child: Stack(
            children: [
              Container (
                width: widgetWidth,
                padding: EdgeInsets.all(15.0),
                 child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 24.0,
                          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            gradient: LinearGradient(
                              colors: [Colors.white.withOpacity(0.3), Colors.white.withOpacity(0.1)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                          child: Text(
                            "Nível ${activitie.level}",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 9,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Fieldwork-Geo"
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Icon(Icons.chevron_right, color: Colors.white),
                      ],
                    ),
                    SizedBox(height: 4),
                    Text(
                      activitie.title,
                      style: const TextStyle(
                        fontFamily: "Fieldwork-Geo",
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFFFFFFFF),
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      activitie.description,
                      style: const TextStyle(
                        fontFamily: "Fieldwork-Geo",
                        fontSize: 9,
                        fontWeight: FontWeight.w200,
                        color: Color(0xFFFFFFFF),
                      ),
                    ),
                    SizedBox(height: 10),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 1.5, horizontal: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.0),
                          gradient: LinearGradient(
                            colors: [Colors.white.withOpacity(0.3), Colors.white.withOpacity(0.1)],
                            begin: Alignment.topLeft,
                          )
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: widgetWidth*0.70,
                              child: AnimatedProgressBar(
                                progress: progress,
                                maxProgress: 100,
                                barColor: Colors.white,
                                height: 6,
                              )
                            ),
                            const SizedBox(width: 2),
                            Text(
                              "${progress.ceil()} %",
                              style: const TextStyle(
                                fontFamily: "Fieldwork-Geo",
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFFFFFFFF),
                              )
                            )
                        ],)
  
                      ),
                  ],
                )
              ),
              if (isLocked) ...[
                Positioned.fill(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                      child: Container(
                        alignment: Alignment.center,
                        color: Colors.grey.withOpacity(0.6),
                        child: Image.asset(
                          'assets/images/appIcons/icon-lock-default.png',
                          color: Colors.white,
                          height: 24,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ],
      ),
    );
  }
}
