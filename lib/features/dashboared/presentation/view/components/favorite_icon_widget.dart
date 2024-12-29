import 'package:flutter/material.dart';

class FavoriteIconWidget extends StatefulWidget {
  const FavoriteIconWidget({super.key});

  @override
  State<FavoriteIconWidget> createState() => _FavoriteIconWidgetState();
}

class _FavoriteIconWidgetState extends State<FavoriteIconWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> scaleingAnimation;
  @override
  void initState() {
    super.initState();
   initScaleingAnimation();
   
  }

  void initScaleingAnimation() {
     animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    scaleingAnimation =
        Tween<double>(begin: 1.0, end: 1.5).animate(animationController);
  }

  executeScaleingAnimation() {
    animationController.forward().then(
          (_) => animationController.reverse(),
        );

    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return
           InkWell(
                    onTap: () =>executeScaleingAnimation ,
                    child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 5,
                                  offset: const Offset(0, 4),
                                  spreadRadius: 2,
                                  color: Colors.grey.withOpacity(0.3))
                            ]),
                        child: 
          AnimatedBuilder(
            animation: scaleingAnimation,
            builder: (context, child) => ScaleTransition(
              scale: scaleingAnimation,
              child: Icon(
                Icons.favorite_outline,
                color: Colors.grey[400],
              ),
            ),
          ),),
         
    );
  }
}
