import 'package:flutter/material.dart';
import 'package:learn/utils/animatedProgressBar.dart';
import 'dart:ui';

class LessionCardStatic extends StatelessWidget {
  final int level;
  final String title;
  final String description;
  final double progress;
  final Color progressColor;
  final bool isLocked;
  final List<Color> backgroundGradientColors;
  final List<Color> levelGradientColors;
  final Widget? pageWidget;
  final double? width;
  bool isActivitie;

  LessionCardStatic({
    required this.level,
    required this.title,
    required this.description,
    this.progress = 0.0,
    this.isLocked = true,
    this.backgroundGradientColors = const [Color(0XFF7A7FFF), Color(0xFF040862)],
    this.levelGradientColors = const [Color(0xFFFFFFFF), Color(0xFFFFFFFF)],
    this.progressColor = const Color(0XFFFFFFFF),
    this.pageWidget,
    this.width,
    this.isActivitie = false
  });

  @override
  Widget build(BuildContext context) {
    double widgetWidth = width ?? MediaQuery.of(context).size.width -10;
    return Container(
          width: widgetWidth,
          height: 130,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            gradient: LinearGradient(
              colors: backgroundGradientColors,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                offset: Offset(0, 4),
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
                            "Nível ${level}",
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
                      title,
                      style: const TextStyle(
                        fontFamily: "Fieldwork-Geo",
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFFFFFFFF),
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      description,
                      style: const TextStyle(
                        fontFamily: "Fieldwork-Geo",
                        fontSize: 9,
                        fontWeight: FontWeight.w200,
                        color: Color(0xFFFFFFFF),
                      ),
                    ),
                    SizedBox(height: 10),
                    // Barra de progresso
                    if (isActivitie)
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
                                barColor: progressColor,
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
                      filter: ImageFilter.blur(sigmaX: 2, sigmaY: 5),
                      child: Container(
                        alignment: Alignment.center,
                        color: Colors.white.withOpacity(0.1),
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

class ActivitieCardStatic extends LessionCardStatic {
  List<LessionCardStatic>? lessionsList;
  final String pageTitle;
  final String pageDescription;
  final bool isActivitie;

  ActivitieCardStatic({
    required this.pageTitle,
    required this.pageDescription, 
    this.lessionsList,
    required int level,
    required String title,
    required String description,
    double progress = 0.0,
    bool isLocked = true,
    List<Color> backgroundGradientColors = const [Color(0XFF7A7FFF), Color(0xFF040862)],
    List<Color> levelGradientColors = const [Color(0xFFFFFFFF), Color(0xFFFFFFFF)],
    Color progressColor = const Color(0XFFFFFFFF),
    Widget? pageWidget,
    double? width,
    this.isActivitie = true
  }) : super (
    level : level,
    title : title,
    description : description,
    progress : progress,
    isLocked : isLocked,
    backgroundGradientColors : backgroundGradientColors,
    levelGradientColors : levelGradientColors,
    progressColor : progressColor,
    pageWidget : pageWidget,
    width : width,
    isActivitie : isActivitie
  );

  @override
  Widget build(BuildContext context) {
    return super.build(context);
  }
}