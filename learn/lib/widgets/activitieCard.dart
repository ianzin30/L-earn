import 'package:flutter/material.dart';
import 'package:learn/utils/animatedProgressBar.dart';
import 'dart:ui';

class ActivitieCard extends StatefulWidget {
  final int level;
  final String title;
  final String description;
  final double progress;
  final Color progressColor;
  final bool isLocked;
  final List<Color> backgroundGradientColors;
  final List<Color> levelGradientColors;
  final VoidCallback? onPressed;

  ActivitieCard({
    required this.level,
    required this.title,
    required this.description,
    this.progress = 0.0,
    this.isLocked = true,
    this.backgroundGradientColors = const [Color(0XFF7A7FFF), Color(0xFF040862)],
    this.levelGradientColors = const [Color(0xFFFFFFFF), Color(0xFFFFFFFF)],
    this.progressColor = const Color(0XFFFFFFFF),
    this.onPressed,
  });

  @override
  _ActivitieCardState createState() => _ActivitieCardState();
}

class _ActivitieCardState extends State<ActivitieCard> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 100),
      vsync: this,
      lowerBound: 0.95,
      upperBound: 1.05,
    );
    _scaleAnimation = CurvedAnimation(parent: _animationController, curve: Curves.easeInOut);
    _animationController.addListener(() {
      if (_animationController.isCompleted) {
        _animationController.reverse();
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onTap() {
    if (widget.onPressed != null) {
      widget.onPressed!();
    }
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width - 40;
    return GestureDetector(
      onTap: _onTap,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Container(
          width: screenWidth,
          height: 120,
          //padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            gradient: LinearGradient(
              colors: widget.backgroundGradientColors,
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
          padding: EdgeInsets.all(10.0),
           child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
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
                      "Nível ${widget.level}",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 9,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Fieldwork-Geo"
                      ),
                    ),
                  ),
                  Icon(Icons.chevron_right, color: Colors.white),
                ],
              ),
              SizedBox(height: 4),
              Text(
                widget.title,
                style: const TextStyle(
                  fontFamily: "Fieldwork-Geo",
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFFFFFFFF),
                ),
              ),
              SizedBox(height: 2),
              Text(
                widget.description,
                style: const TextStyle(
                  fontFamily: "Fieldwork-Geo",
                  fontSize: 9,
                  fontWeight: FontWeight.w200,
                  color: Color(0xFFFFFFFF),
                ),
              ),
              SizedBox(height: 8),
              // Barra de progresso
              Container(
                padding: const EdgeInsets.all(5),
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
                      width: 280,
                      child: AnimatedProgressBar(
                        progress: widget.progress,
                        maxProgress: 100,
                        barColor: widget.progressColor,
                      )
                    ),
                    const SizedBox(width: 2),
                    Text(
                      "${widget.progress.ceil()} %",
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
          if (widget.isLocked) ...[
            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 2, sigmaY: 5),
                  child: Container(
                    alignment: Alignment.center,
                    color: Colors.white.withOpacity(0.1),
                    child: const Icon(
                      Icons.lock_outline,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
        ),
      ),
    );
  }
}
